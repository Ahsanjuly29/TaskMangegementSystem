<?php

namespace App\Actions\TaskApi;

use App\Models\Task;
use Illuminate\Support\Facades\Auth;

class FilterTasks
{
    public function handle($request)
    {
        // if relationship is needed.  // with('assignedTo', 'createdBy')->
        
        // there is not administration Control. So, Each person can see only his/her own tasks.
        $taskData = Task::whereAny(['assigned_to', 'created_by'], Auth::user()->id);

        if (!empty($request->status)) {
            $taskData->where('status', $request->status);
        }

        if (!empty($request->searchName)) {
            $taskData->where('name', 'like', '%' . $request->searchName . '%');
        }

        return $taskData->orderBy('due_date', 'ASC')->paginate(10);
    }
}
