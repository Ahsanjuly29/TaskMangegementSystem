<?php

namespace App\Http\Controllers;

use App\DataTables\TasksDataTable;
use App\Models\Task;

class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(TasksDataTable $dataTable)
    {
        return $dataTable->render('task.index'); // Yajra-Data-Table render aData and show Table
        // return $dataTable->ajax();
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('task.create');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        try {
            $taskData = Task::owner()->find($id);
            if (empty($taskData)) {
                throw new \Exception('Unable to Find This Task');
            }

            return view('task.edit', [
                'data' => $taskData,
            ]);
        } catch (\Exception $e) {
            return errorResponse($e);
        }
    }

    public function datatables(TasksDataTable $dataTable)
    {
        return $dataTable->ajax();
    }

    // public function show(TasksDataTable $dataTable)
    // {
    //     return $dataTable->ajax();
    // }
}
