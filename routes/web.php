<?php

use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TaskController;
use App\Models\Task;
use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::get('/', function () {
    return view('welcome');
})->name('/');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Task Controller
    Route::get('task', [TaskController::class, 'index'])->name('task.index');
    Route::get('task/create', [TaskController::class, 'create'])->name('task.create');
    Route::get('task/{id}/edit', [TaskController::class, 'edit'])->name('task.edit');
    Route::get('task/datatables', [TaskController::class, 'datatables'])->name('task.datatables');
});



Route::get('/ajax-crud', function () {
    return view('ajax.index', [
        'tasks' => Task::orderBy('id', 'DESC')->paginate(10)
    ]);
})->name('ajax-crud')->middleware('auth');
