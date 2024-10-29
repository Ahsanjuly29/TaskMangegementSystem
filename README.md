Thank you for clarifying. Here’s an updated README that indicates linking scripts in the `@extends('master.app')` layout, without adding them directly in the view setup.

---

# 📋 Laravel AJAX CRUD Task Management Application

This Laravel project implements AJAX-based CRUD operations for managing tasks. The project includes dynamic modal forms for creating and editing tasks, a multi-delete feature, and integrates with Laravel's API routes for back-end processing.

## 📑 Table of Contents

- [✨ Features](#features)
- [⚙️ Installation](#installation)
- [🖥️ Backend API Setup](#backend-api-setup)
- [🌐 Frontend Setup](#frontend-setup)
- [🚀 Usage](#usage)
- [📜 License](#license)

## ✨ Features

- **AJAX CRUD Operations**: Perform create, read, update, and delete operations without page reloads.
- **Dynamic Modals**: Unified forms for creating and editing tasks within a modal.
- **Multi-Delete Functionality**: Allows multiple task deletion.
- **CSRF and Bearer Token Security**: Uses Laravel's built-in security tokens for AJAX requests.

## ⚙️ Installation

1. **Clone the Repository**  
   ```bash
   git clone <repository-url>
   cd project-directory
   ```

2. **Install Dependencies**  
   ```bash
   composer install
   npm install
   npm run dev
   ```

3. **Configure Environment**  
   Copy `.env.example` to `.env`, then configure database and other environment settings.
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```

4. **Run Migrations**  
   ```bash
   php artisan migrate
   ```

## 🖥️ Backend API Setup

1. **Create Model, Controller, and Migration for Tasks**  
   ```bash
   php artisan make:model Task -mcr
   ```
   Update the migration file to add necessary columns for tasks:

   ```php
   Schema::create('tasks', function (Blueprint $table) {
       $table->id();
       $table->string('name');
       $table->longText('description')->nullable();
       $table->string('status')->default('PENDING')->comment('PENDING', 'IN_PROGRESS', 'COMPLETED');
       $table->unsignedBigInteger('assigned_to');
       $table->unsignedBigInteger('created_by');
       $table->dateTime('due_date');
       $table->timestamps();
   });

   Schema::table('tasks', function (Blueprint $table) {
       $table->foreign('assigned_to')->references('id')->on('users');
       $table->foreign('created_by')->references('id')->on('users');
   });
   ```

2. **Define Relationships in the Model**  
   In `Task.php`, add the `fillable` attributes and define relationships as needed.

3. **Set up API Routes**  
   Define routes in `api.php` using a controller, e.g., `ApiTaskController`:
   ```php
   Route::resource('api-task', ApiTaskController::class);
   ```

4. **Controller Logic**  
   Implement CRUD logic in `ApiTaskController.php`. Below is an example `index` method:

   ```php
   public function index(Request $request, FilterTasks $filterTasks) {
       try {
           $data = $filterTasks->handle($request, 100);
           return successResponse('Showing All Tasks', $data);
       } catch (\Exception $e) {
           return errorResponse($e);
       }
   }
   ```

5. **Custom Requests and Validation**  
   Create a custom request file, e.g., `TaskRequest.php`, to handle validation:

   ```php
   public function rules(): array {
       return [
           'name' => 'required',
           'description' => 'nullable',
           'status' => 'required|in:PENDING,IN_PROGRESS,COMPLETED',
           'due_date' => 'required|date_format:Y-m-d',
       ];
   }
   ```

   Use a trait `IsValidRequest` to handle validation responses in JSON format, ensuring all API responses are standardized.

6. **Filter Logic (Optional)**  
   To simplify controller logic, you may use actions such as `FilterTasks`:
   ```php
   class FilterTasks {
       public function handle($request, $dataAmount) {
           $taskData = Task::owner();
           if (!empty($request->status)) {
               $taskData->where('status', $request->status);
           }
           if (!empty($request->searchName)) {
               $taskData->where('name', 'like', '%' . $request->searchName . '%');
           }
           return $taskData->orderBy('due_date', 'ASC')->paginate($dataAmount);
       }
   }
   ```

   Sure! Here's the updated README section with the new header for the frontend setup, along with the existing content structured under it.

---

# Task Management System

This repository provides a Task Management System built with Laravel and demonstrates how to implement CRUD operations using AJAX.

## Overview

The system allows users to create, read, update, and delete tasks without refreshing the page, enhancing the user experience.

## 🌐 Frontend Setup

### 1. Define Routes

Add the following route to your `web.php` file to redirect to the view page and apply the middleware group for authentication:

```php
use App\Models\Task;

Route::get('/ajax-crud', function () {
    return view('ajax.index', [
        'tasks' => Task::orderBy('id', 'DESC')->paginate(10)
    ]);
})->name('ajax-crud')->middleware('auth');
```

### 2. Create the View Page

Create a new view file named `index.blade.php` in the `resources/views/ajax` folder. This file will display the tasks and include buttons for CRUD operations.

### 3. Link the JavaScript File

Download the `ajax-jquery-crud.js` file and link it in your master layout (`app.blade.php`). This JavaScript file will handle all CRUD operations via AJAX and will be available throughout your project.

```blade
<script src="{{ asset('assets/js/ajax-jquery-crud.js') }}"></script>
```

## File Structure

```
app/
resources/
├── views/
│   ├── ajax/
│   │   └── index.blade.php
│   └── master/
│       └── app.blade.php
public/
└── js/
    └── ajax-jquery-crud.js
```

## Key Files

### 1. `app.blade.php`

This is the main layout file that includes necessary CSS and JavaScript files.

```blade
<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'Laravel') }}</title>
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
    @yield('custom-css')
</head>
<body>
    @yield('main-body')
    @include('ajax.form-modal')
    <script src="{{ asset('assets/js/jquery.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/js/ajax-jquery-crud.js') }}"></script>
    @yield('custom-js')
</body>
</html>
```

### 2. `index.blade.php`

This file contains the table for displaying tasks and action buttons for CRUD operations.

```blade
@extends('master.app')
@section('main-body')
<div class="container">
    <div class="card">
        <div class="card-header">Manage Tasks</div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover" id="task-table">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($tasks as $task)
                        <tr>
                            <td>{{ $task->id }}</td>
                            <td>{{ $task->name }}</td>
                            <td>
                                <button class="btn btn-primary edit" data-id="{{ $task->id }}">Edit</button>
                                <button class="btn btn-danger delete" data-id="{{ $task->id }}">Delete</button>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
                <button class="btn btn-success" id="add-task">Add Task</button>
            </div>
        </div>
    </div>
</div>
@endsection
```

### 3. `ajax-jquery-crud.js`

This JavaScript file handles AJAX requests for creating, updating, and deleting tasks.

```javascript
$(document).ready(function() {
    // Open modal for adding a task
    $('#add-task').click(function() {
        $('#task-form')[0].reset();
        $('#taskModalLabel').text('Add Task');
        $('#task-id').val('');
        $('#taskModal').modal('show');
    });

    // Submit form for adding/updating a task
    $('#task-form').submit(function(event) {
        event.preventDefault();
        const id = $('#task-id').val();
        const url = id ? `/tasks/${id}` : '/tasks';
        const method = id ? 'PUT' : 'POST';

        $.ajax({
            url: url,
            type: method,
            data: $(this).serialize(),
            success: function(response) {
                toastr.success(response.message);
                location.reload();
            },
            error: function(xhr) {
                toastr.error(xhr.responseJSON.message);
            }
        });
    });

    // Edit a task
    $('.edit').click(function() {
        const id = $(this).data('id');
        $.get(`/tasks/${id}/edit`, function(data) {
            $('#task-id').val(data.id);
            $('#task-name').val(data.name);
            $('#taskModalLabel').text('Edit Task');
            $('#taskModal').modal('show');
        });
    });

    // Delete a task
    $('.delete').click(function() {
        const id = $(this).data('id');
        if (confirm('Are you sure you want to delete this task?')) {
            $.ajax({
                url: `/tasks/${id}`,
                type: 'DELETE',
                success: function(response) {
                    toastr.success(response.message);
                    location.reload();
                },
                error: function(xhr) {
                    toastr.error(xhr.responseJSON.message);
                }
            });
        }
    });
});
```

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
