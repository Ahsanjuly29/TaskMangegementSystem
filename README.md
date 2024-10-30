```markdown
# 📝 Task Management System Using Dynamic AJAX CRUD with Laravel API and Bearer Token 🔒

Welcome to the **Task Management System** 🎉! This Laravel-based project provides a robust framework for managing tasks through dynamic AJAX CRUD operations, complete with API support using Bearer Token authentication via Laravel Sanctum. Ideal for developers looking to implement a comprehensive task management solution or integrate Yajra Datatables for efficient data handling.

---

## 📂 Table of Contents 📂
1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
4. [Setup](#setup)
5. [API Documentation](#api-documentation)
6. [Database Structure](#database-structure)
7. [Routes](#routes)
8. [Usage Guide](#usage-guide)
9. [Error Handling](#error-handling)
10. [Contributing](#contributing)
11. [License](#license)

---

## 📖 Introduction

This **Task Management System** is designed to handle task-related CRUD operations with efficiency and ease. The system utilizes **Laravel Sanctum** for secure API token authentication, enabling both web and API-based task management. Users and developers can create, update, delete, and view tasks through both interfaces, ensuring flexibility in usage.

### 🎯 Purpose

The project is tailored for developers aiming to add or understand the following:
- Dynamic **AJAX** CRUD operations with **Yajra Datatables** integration.
- **Laravel Sanctum**-based API authentication using **Bearer Tokens**.
- Web-based and API-based task management workflows.

---

## ✨ Features ✨

### 🔐 Secure Authentication
- **Laravel Sanctum** integration for API token-based authentication.
- **Bearer Tokens** for secure access to API endpoints.
  
### 🔄 Dynamic AJAX CRUD
- Full CRUD (Create, Read, Update, Delete) operations for managing tasks.
- **Yajra Datatables** support for seamless data handling in AJAX requests.

### 📊 Data Management with Yajra Datatables
- Real-time data display and filtering with AJAX requests.
- Pagination, sorting, and searching made easy with Yajra Datatables.

### 🛠️ User and Task Management
- Create, edit, delete, and view users and tasks.
- Task status management and due date adjustment.

---

## ⚙️ Installation ⚙️

Follow these steps to get the project up and running on your local machine.

### Prerequisites 📝
- **PHP** (>= 8.0)
- **Composer**
- **Laravel** (>= 9.x)
- **Node.js** and **npm**
- **MySQL** or compatible database

### Step 1: Clone the Repository 🗂️
```bash
git clone https://github.com/Ahsanjuly29/TaskMangegementSystem.git
cd TaskMangegementSystem
```

### Step 2: Install Dependencies 📦
```bash
composer install
npm install && npm run dev
```

### Step 3: Environment Setup 🌐
Copy the example environment file and configure the necessary credentials.
```bash
cp .env.example .env
php artisan key:generate
```

Configure your `.env` file with appropriate **database**, **mail**, and **Sanctum** settings.

### Step 4: Run Migrations and Seeders 💾
```bash
php artisan migrate --seed
```

### Step 5: Start the Development Server 🚀
```bash
php artisan serve
```

Access the application at **http://localhost:8000**.

---

## 🛠️ Setup 🛠️

Ensure you have set up Laravel Sanctum for API authentication.

### Sanctum Installation 🛡️
1. Install Sanctum via Composer:
   ```bash
   composer require laravel/sanctum
   ```
2. Publish the Sanctum configuration file:
   ```bash
   php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
   ```
3. Run Sanctum migrations:
   ```bash
   php artisan migrate
   ```

Sanctum is now ready to be used for secure token-based API authentication!

---

## 📡 API Documentation

This section details each available API endpoint with descriptions, parameters, and example responses.

### 🧾 Authentication Routes

#### Register
- **Endpoint**: `/api/register`
- **Method**: `POST`
- **Description**: Registers a new user.
- **Parameters**: 
  - `name`: User’s name.
  - `email`: User’s email.
  - `password`: User’s password.

#### Login
- **Endpoint**: `/api/login`
- **Method**: `POST`
- **Description**: Authenticates a user and returns a Bearer Token.
- **Parameters**: 
  - `email`: User’s email.
  - `password`: User’s password.

#### Logout
- **Endpoint**: `/api/logout`
- **Method**: `POST`
- **Description**: Logs out the authenticated user.

#### Fetch User Information
- **Endpoint**: `/api/user`
- **Method**: `GET`
- **Description**: Retrieves information about the authenticated user.

---

### 🗂️ Task Management Routes

#### Create Task
- **Endpoint**: `/api/api-task`
- **Method**: `POST`
- **Description**: Creates a new task.
- **Parameters**: 
  - `title`: Title of the task.
  - `description`: Task details.
  - `due_date`: Task's due date.

#### Update Task
- **Endpoint**: `/api/api-task/{id}`
- **Method**: `PUT`
- **Description**: Updates an existing task.
- **Parameters**:
  - `id`: ID of the task to be updated.

#### Delete Task
- **Endpoint**: `/api/api-task/{id}`
- **Method**: `DELETE`
- **Description**: Deletes an existing task.

#### Change Task Status
- **Endpoint**: `/api/change-status`
- **Method**: `GET`
- **Description**: Updates the status of a task.

---

## 🗄️ Database Structure

### Tables
- `users`: Stores user information.
- `tasks`: Stores task data.

### Example Migration: Tasks Table
```php
Schema::create('tasks', function (Blueprint $table) {
    $table->id();
    $table->foreignId('user_id')->constrained();
    $table->string('title');
    $table->text('description')->nullable();
    $table->date('due_date');
    $table->enum('status', ['pending', 'completed'])->default('pending');
    $table->timestamps();
});
```

---

## 🌐 Routes

### web.php
The following routes are used for the web interface, handling authentication and task management views.

```php
Route::get('/', function () {
    return view('welcome');
})->name('/');

Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::resource('task', TaskController::class);
});
```

### api.php
These routes are protected by Sanctum for API-based interactions.

```php
Route::middleware(['auth:sanctum'])->group(function () {
    Route::resource('api-task', ApiTaskController::class);
    Route::get('/user', function (Request $request) {
        return $request->user();
    });
});
```

---

## 📖 Usage Guide

1. **Task Creation**: Add new tasks through the web interface or via API.
2. **Task Updates**: Edit task details dynamically using AJAX-powered modals.
3. **Data Filtering**: Use Yajra Datatables to sort, search, and paginate tasks.

---

## ❗ Error Handling

Common issues:
- **Authentication Failure**: Ensure Bearer Token is correctly attached for protected routes.
- **Database Errors**: Run migrations and check .env configurations.

---

## 🧩 Contributing

Contributions are welcome! Fork the repository, make your changes, and submit a pull request.

---

## 📜 License

This project is licensed under the MIT License.

---

Thank you for using **Task Management System**! 🔥

---
```
