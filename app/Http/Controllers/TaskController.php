<?php

namespace App\Http\Controllers;

use App\Actions\TaskApi\FilterTasks;
use App\Http\Requests\TaskRequest;
use App\Models\Task;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    /**
     * Display all listing of task.
     *
     * @response
     */
    public function index(Request $request, FilterTasks $filterTasks)
    {
        try {
            $data = $filterTasks->handle($request);

            return successResponse('Showing All Tasks', $data);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Display form to Create Task.
     */
    public function create()
    {
        //
    }

    /**
     * Store new task.
     */
    public function store(TaskRequest $request)
    {
        try {
            $data = $request->validated();
            $data['assigned_to'] = Auth::user()->id;
            $data['created_by'] = Auth::user()->id;

            $taskData = Task::create($data);

            return successResponse('New Task has been Created', $taskData);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Display the specified task.
     */
    public function show(string $id)
    {
        return $this->edit($id);
    }

    /**
     * Display the form for editing the task.
     */
    public function edit(string $id)
    {
        try {
            $taskData = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (empty($taskData)) {
                throw new \Exception('Unable to Find This Task');
            }

            return successResponse('Task Details', $taskData);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Update task in DB.
     */
    public function update(TaskRequest $request, string $id)
    {
        try {
            $taskData = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (empty($taskData)) {
                throw new \Exception('Unable to Find This Task');
            }

            $taskData->update($request->validated());

            return successResponse('This Task has been Updated', $taskData);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Update task Status.
     */
    public function changeStatus(Request $request)
    {
        try {
            $taskData = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($request->id);
            if (empty($taskData)) {
                throw new \Exception('Unable to Find This Task');
            }

            $taskData->update([
                'status' => $request->status,
            ]);

            return successResponse('Status updated to '.$request->status, $taskData);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Update Due Date Of task.
     */
    public function changeDueDate(Request $request)
    {
        try {
            $taskData = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($request->id);
            if (empty($taskData)) {
                throw new \Exception('Unable to Find This Task');
            }

            $taskData->update([
                'due_date' => $request->due_date,
            ]);

            return successResponse('Due date updated to '.$request->due_date, $taskData);

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    /**
     * Remove the Task from storage.
     */
    public function destroy(string $id)
    {
        try {
            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (! $task) {
                throw new \Exception('Unable to Find This Task');
            }

            $task->destroy($id);

            return successResponse('This Task has been Destroyed');

        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }
}
