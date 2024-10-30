```markdown
# 📋 Task Management System Using Dynamic AJAX CRUD and Laravel API with Bearer Token 🚀

Welcome to the **Task Management System**! 🎉 This project is built with **Laravel**, **AJAX**, and **Yajra Datatables**, making it ideal for managing tasks dynamically, with a smooth user experience. It incorporates a secure **API** using Laravel **Sanctum** for authentication via Bearer tokens, enabling restricted access and secure CRUD operations. 🌐

---

## 📚 Table of Contents 📚

- [Project Overview](#-project-overview)
- [Key Features](#-key-features)
- [Installation and Setup](#-installation-and-setup)
- [File Structure](#-file-structure)
- [Database Schema](#-database-schema)
- [Routes Overview](#-routes-overview)
- [API Documentation](#-api-documentation)
- [CRUD Operations](#-crud-operations)
- [Usage Guide](#-usage-guide)
- [Error Handling and Troubleshooting](#-error-handling-and-troubleshooting)
- [Contributing](#-contributing)
- [License](#-license)

---

## 📋 Project Overview 📋

The **Task Management System** is a robust and versatile system allowing users to manage tasks using AJAX-powered CRUD operations on the front end, coupled with secure API access on the backend. Designed with Laravel Sanctum for user authentication and Yajra Datatables for data management, it allows for real-time interactions and a dynamic user experience.

### 🔑 Primary Use Cases 🔑

- Efficient task management and CRUD operations with real-time data updates.
- API-based task management using Bearer token authentication for security.
- Dynamic and interactive UI designed for speed and ease of use.

---

## 🌟 Key Features 🌟

- **🔐 Secure Authentication with Sanctum**: Access is protected with Bearer Tokens managed by Laravel Sanctum.
- **⚙️ Dynamic AJAX-based CRUD**: Real-time updates without page reloads for task operations.
- **📊 Yajra Datatables Integration**: Robust, interactive data table experience.
- **🌈 User-friendly Interface**: Simplified, efficient task management UI.
- **🛠️ Extensive API Support**: Complete API endpoints for managing tasks and user accounts.
- **🔁 Role-based Access Control**: Role-based access and functionality across various user types.

---

## 💻 Installation and Setup 💻

To get started, follow these steps to install, configure, and run the project in a local environment! 🛠️

### Step 1: Clone the Repository 🖥️

```bash
git clone https://github.com/Ahsanjuly29/TaskMangegementSystem.git
cd TaskMangegementSystem
```

### Step 2: Install Dependencies 📦

Run the following command to install necessary dependencies:

```bash
composer install
npm install
```

### Step 3: Environment Setup 🌍

Copy the `.env.example` to `.env` and set up the environment:

```bash
cp .env.example .env
```

Make sure to configure the `.env` file with your database credentials, application settings, and mail configurations.

### Step 4: Generate Application Key 🔑

Generate the app key with the following command:

```bash
php artisan key:generate
```

### Step 5: Run Database Migrations 🗄️

```bash
php artisan migrate
```

### Step 6: Seed Database with Initial Data 🌱

For testing purposes, you can populate the database with seeded data:

```bash
php artisan db:seed
```

### Step 7: Start the Server 🌐

```bash
php artisan serve
```

Access the application at `http://localhost:8000`. 🚀

---

## 🗂️ File Structure 🗂️

Below is the primary file structure of this project:

```plaintext
├── app/
│   ├── Http/
│   │   ├── Controllers/
│   │   │   ├── ApiAuthController.php
│   │   │   ├── ApiTaskController.php
│   │   │   └── TaskController.php
├── config/
│   └── sanctum.php           # Sanctum Configuration
├── resources/
│   ├── views/
│   │   └── ajax/             # AJAX CRUD Views
│   │   └── tasks/            # Task Management Views
├── routes/
│   ├── api.php               # API routes
│   └── web.php               # Web routes
├── .env                      # Environment settings
└── database/seeders/         # Database seeders
```

### Key Files and Directories

- **Controllers**: Located in `app/Http/Controllers`, containing the logic for API and web requests.
- **Routes**: Defined in `routes/api.php` and `routes/web.php`.
- **Views**: Templates for AJAX-based CRUD in `resources/views/ajax`.

---

## 🗄️ Database Schema 🗄️

The database includes tables with relationships between `users` and `tasks`. Below is a quick breakdown:

### Tables

- **Users Table**: Stores user information and credentials.
- **Tasks Table**: Contains task details such as title, description, and status.

### Migrations

Using **Laravel migrations**, setting up the database is easy. Relationships are established between `users` and `tasks`.

---

## 🔀 Routes Overview 🔀

### Web Routes (`web.php`)

```php
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\TaskController;
use Illuminate\Support\Facades\Route;

require __DIR__ . '/auth.php';

Route::get('/', function () { return view('welcome'); })->name('/');
Route::get('/dashboard', function () { return view('dashboard'); })->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
});
```

---

## 📬 API Documentation 📬

### Authentication Routes

| Method | Endpoint            | Description                        |
|--------|----------------------|------------------------------------|
| POST   | /register           | Register new user                 |
| POST   | /login              | User login and token generation   |
| POST   | /logout             | User logout and token revocation  |

### Task Management

| Method | Endpoint            | Description                |
|--------|----------------------|----------------------------|
| GET    | /api/api-task        | Lists all tasks             |
| POST   | /api/api-task        | Creates a new task          |
| GET    | /api/api-task/{id}   | Shows details of a task     |
| PUT    | /api/api-task/{id}   | Updates an existing task    |
| DELETE | /api/api-task/{id}   | Deletes a task              |

---

## 📊 CRUD Operations 📊

### ➕ Creating a Task

To create a task, send a `POST` request to `/api/api-task` with task data.

### 📖 Reading Tasks

To view tasks, use a `GET` request to `/api/api-task`.

### ✏️ Updating a Task

To update a task, send a `PUT` request to `/api/api-task/{id}`.

### 🗑️ Deleting a Task

To delete a task, send a `DELETE` request to `/api/api-task/{id}`.

---

## 🛠️ Usage Guide 🛠️

1. **Login/Register** - Use the authentication system to register or log in.
2. **Add Task** - Use the **Create Task** page to add new tasks.
3. **View Tasks** - List of tasks displayed with pagination.
4. **Edit Tasks** - Update task details via AJAX.
5. **Delete Task** - Remove tasks instantly with AJAX-based deletion.

---

## 🚧 Error Handling and Troubleshooting 🚧

### Database Connection Issues

Ensure `.env` settings are correct for `DB_DATABASE`, `DB_USERNAME`, and `DB_PASSWORD`.

### Authentication Issues

Verify Bearer token is correctly attached for protected routes.

---

## 🤝 Contributing 🤝

We welcome contributions! Fork the repository, make changes, and submit a pull request. Let’s improve the system together.

## 📄 License 📄

This project is licensed under the MIT License.

Thank you for exploring the **Task Management System**! Have questions? Contact us or contribute today!
 