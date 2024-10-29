<?php

namespace App\DataTables;

use App\Models\Task;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class TasksDataTable extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */

    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return datatables()
            ->eloquent($query)
            ->editColumn('created_by', function ($task) {
                return $task->createdBy ? $task->createdBy->name : 'N/A';
            })
            ->editColumn('assigned_to', function ($task) {
                return $task->assignedTo ? $task->assignedTo->name : 'N/A';
            })
            ->editColumn('created_at', function ($task) {
                return date('Y-m-d', strtotime($task->created_at)) . '(' . $task->created_at->diffForHumans() . ')';  // Humanize created_at
            })
            ->addColumn('status', function ($task) {
                return '<span class="btn btn-sm btn-info w-100">' . strtolower(str_replace('_', ' ', $task->status)) . '</span>'; // Display Task Status
            })
            ->addColumn('action', function ($task) {
                $editUrl = route('task.edit', $task->id); // Generate edit link
                $deleteUrl = route('api-task.destroy', $task->id); // Generate delete link

                return '<a href="' . $editUrl . '" class="btn btn-sm btn-primary">Edit</a>
                        <button class="btn btn-sm btn-danger delete-task" data-id="' . $task->id . '" data-url="' . $deleteUrl . '">Delete</button>';
            })
            ->rawColumns(['action', 'status']);
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(Task $task): QueryBuilder
    {
        return $task->owner()->orderBy('id', 'asc')->newQuery();
        //
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('tasks-table')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->orderBy(1)
            ->selectStyleSingle()
            // ->dom('PBfrtip') // Enable buttons
            // ->dom('lrtip')
            ->buttons([
                Button::make('excel')->className('btn btn-sm btn-success')->text('Export to Excel'),  // Styled as Bootstrap success button
                Button::make('csv')->className('btn btn-sm btn-warning'),    // Styled as Bootstrap warning button
                Button::make('pdf')->className('btn btn-sm btn-danger'),     // Styled as Bootstrap danger button
                Button::make('print')->className('btn btn-sm btn-secondary'),     // Styled as Bootstrap info button
                Button::make([
                    'text' => 'Reset Filters',
                    'className' => 'btn btn-sm btn-danger',
                    'action' => 'function (e, dt, button, config) {
                        dt.search("").columns().search("").draw();
                    }'
                ]),
                Button::make([
                    'text' => 'Reload',
                    'className' => 'btn btn-sm btn-info',
                    'action' => 'function (e, dt, node, config) {
                        dt.ajax.reload();
                    }'
                ])
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make('id'),
            Column::make('name'),
            Column::make('status')->addClass('text-center'),
            Column::make('assigned_to')->addClass('text-center'),
            Column::make('created_by')->addClass('text-center'),
            Column::make('created_at'),
            Column::computed('action')
                ->exportable(false)
                ->printable(false)
                ->width(150),
        ];
    }

    /**
     * Get the filename for export.
     */
    protected function filename(): string
    {
        return 'Tasks_' . date('Y-m-d');
    }
}
