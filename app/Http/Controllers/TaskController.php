<?php

namespace App\Http\Controllers;

use App\Actions\TaskApi\FilterTasks;
use App\Http\Requests\TaskRequest;
use App\Models\Task;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, FilterTasks $filterTasks)
    {
        try {
            return response()->json([
                'status' => 1,
                'message' => 'Showing All Tasks',
                'data' => $filterTasks->handle($request),
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(TaskRequest $request)
    {
        try {
            $data = $request->validated();
            $data['assigned_to'] = Auth::user()->id;
            $data['created_by'] = Auth::user()->id;

            return response()->json([
                'status' => 1,
                'message' => 'New Task has been Created',
                'data' => Task::create($data),
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        return $this->edit($id);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id) {
        try {

            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (empty($task)) {
                throw new \Exception('Unable to Find This Task');
            }

            return response()->json([
                'status' => 1,
                'message' => 'Task Details',
                'data' => $task,
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(TaskRequest $request, string $id)
    {
        try {
            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (empty($task)) {
                throw new \Exception('Unable to Find This Task');
            }
            $task->update($request->validated());
            
            return response()->json([
                'status' => 1,
                'message' => 'This Task has been Updated',
                'data' => $task,
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }

    public function changeStatus(Request $request)
    {
        try {
            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($request->id);
            if (empty($task)) {
                throw new \Exception('Unable to Find This Task');
            }

            $task->update([
                'status' => $request->status
            ]);

            return response()->json([
                'status' => 1,
                'message' => 'Status updated to '.$request->status,
                'data' => []
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }

    public function changeDueDate(Request $request)
    {
        try {
            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($request->id);
            if (empty($task)) {
                throw new \Exception('Unable to Find This Task');
            }

            $task->update([
                'due_date' => $request->due_date
            ]);

            return response()->json([
                'status' => 1,
                'message' => 'Due date updated to '.$request->due_date,
                'data' => []
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }



    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        try {
            $task = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id)->find($id);
            if (! $task) {
                throw new \Exception('Unable to Find This Task');
            }

            $task->destroy($id);
            return response()->json([
                'status' => 1,
                'message' => 'This Task has been Destroyed',
            ], 200);
        } catch (\Exception $e) {

            return response()->json([
                'status' => 0,
                'message' => $e->getMessage()
            ], 200);
        }
    }
}
