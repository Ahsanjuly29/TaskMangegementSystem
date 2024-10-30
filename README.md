# 📋 Task Management System using Dynamic AJAX CRUD & Laravel API with BEARER TOKEN

[![Laravel](https://img.shields.io/badge/Laravel-8.x-red?style=flat&logo=laravel)](https://laravel.com)
[![AJAX CRUD](https://img.shields.io/badge/AJAX-CRUD-yellowgreen)](https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX)
[![Sanctum](https://img.shields.io/badge/Laravel-Sanctum-blueviolet)](https://laravel.com/docs/8.x/sanctum)
[![Yajra Datatables](https://img.shields.io/badge/Yajra-Datatables-orange)](https://yajrabox.com/docs/laravel-datatables)

Welcome to the **Task Management System** — a dynamic, API-driven solution designed to enhance task handling and user management in existing Laravel projects. This project leverages **AJAX** for seamless CRUD operations and secures API calls with Laravel Sanctum's Bearer Token.

## 🚀 Features

- **Dynamic AJAX CRUD**: Effortlessly add, edit, delete, and retrieve data.
- **Bearer Token Authentication**: API endpoints are secured using Laravel Sanctum.
- **User & Task Management**: Built-in functionalities for user and task operations.
- **Extendable for Yajra Datatables**: Easily integrate Yajra Datatables for enhanced data display.

## 🧩 Prerequisites

- Familiarity with Laravel framework.
- Laravel 8.x installed and configured.
- Laravel Sanctum package for token-based API authentication.
  
> **Note**: This project assumes prior installation of Laravel; refer to the [official Laravel documentation](https://laravel.com/docs/8.x) if needed.

## 🛠️ Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/Ahsanjuly29/TaskMangegementSystem.git
   cd TaskMangegementSystem
   ```

2. **Environment Configuration**:
   Set up `.env` file with database and Sanctum configuration.

3. **Database Migration**:
   ```bash
   php artisan migrate
   ```

4. **Install Sanctum**:
   ```bash
   composer require laravel/sanctum
   php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"
   php artisan migrate
   ```

5. **Set Up Sanctum Middleware**:
   Add Sanctum's middleware to API routes as per your security requirements.

## 📖 Usage

### API Endpoints

This project includes multiple routes for task and user management, secured by Bearer tokens. See `api.php` for more details.

#### Example API Routes:
- **Authentication**:
  - `POST /api/login` - Login and retrieve a Bearer token.
- **Tasks**:
  - `GET /api/tasks` - Retrieve all tasks.
  - `POST /api/tasks` - Create a new task.
  - `PUT /api/tasks/{id}` - Update a task.
  - `DELETE /api/tasks/{id}` - Delete a task.

### AJAX CRUD Operations

1. **User Actions**: Create, read, update, and delete users dynamically without page reload.
2. **Task Management**: Manage tasks with real-time updates and interactions.

### Using Yajra Datatables

Integrate [Yajra Datatables](https://yajrabox.com/docs/laravel-datatables) for enhanced table views. Refer to Yajra's documentation for setup and customisation.

## 🔐 Security

All API routes are secured using **Bearer Tokens** via Laravel Sanctum. This requires users to authenticate to receive tokens, which are then passed with each request for secure communication.

## 📜 Routes Overview

The routes are set up to handle user and task management with optimal security:

- **`web.php`** includes front-end route logic and redirects.
- **`api.php`** includes API route definitions, secured with Sanctum middleware.

## 🌐 Full Web Page Template for Frontend

The following HTML template demonstrates the frontend layout and features of the Task Management System. This template includes user authentication, task CRUD operations, and task filtering and sorting.

```html
<!DOCTYPE html>
<html>

<head>
    <title>{{ env('APP_NAME') }}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <style>
        * {
            font-family: "Figtree" !important
        }

        a {
            letter-spacing: 2px;
        }

        body {
            background: black;
            color: rgb(180, 180, 180);
        }

        h1 {
            color: rgb(228, 211, 178);
        }

        .title-list {
            list-style-type: none;
        }

        .title-list b {
            font-size: 20px;
            color: white;
        }
    </style>
</head>

<body>

    {{-- @dd(Session::get('loginToken' . auth()->user()->id), session('loginToken' . auth()->user()->id)) --}}

    <!-- Navbar (sit on top) -->
    <div class="w3-top">
        @if (Route::has('login'))
            <div class="w3-bar w3-white w3-padding w3-card" style="letter-spacing:4px;">
                <a href="{{ route('/') }}" class="w3-bar-item w3-button">{{ env('APP_NAME') }}</a>
                <!-- Right-sided navbar links. Hide them on small screens -->
                <div class="w3-right w3-hide-small">
                    @auth
                        <a href="{{ route('dashboard') }}" class="w3-bar-item w3-button">Dashboard</a>
                    @else
                        <a href="{{ route('login') }}" class="w3-bar-item w3-button">Login</a>
                        <a href="{{ route('register') }}" class="w3-bar-item w3-button">Register</a>
                    @endauth
                </div>
            </div>
        @endif
    </div>

    <!-- Page content -->
    <div class="w3-content" style="max-width:1100px">

        <!-- About Section -->
        <div class="w3-row w3-padding-64" id="about">
            <div class="w3-col m6 w3-padding-large w3-hide-small">
                <a href="https://laracasts.com/">
                    <img src="https://laracasts.com/images/path/twitter-card.jpg?v=12"
                        class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="600" height="750">
                </a>
            </div>

            <div class="w3-col m6 w3-padding-large">
                <h1>Website Features: </h1>
                <div>
                    <li class="title-list">
                        <p class="w3-large">
                            <b>User Authentication:</b>
                            Users should be able to register, log in, and log out.
                        </p>
                    </li>
                    <li class="title-list">
                        <p class="w3-large">
                            <b>Task CRUD Operations:</b>
                        <ol>
                            <li>
                                <p class="w3-large">
                                    <b>Create:</b>
                                    Users are able to add new tasks.
                                </p>
                            </li>
                            <li>
                                <p class="w3-large">
                                    <b>Read:</b>
                                    Users are able to view a list of their tasks.
                                </p>
                            </li>
                            <li>
                                <p class="w3-large">
                                    <b>Update: </b>
                                    Users are able to edit existing tasks.
                                </p>
                            </li>
                            <li>
                                <p class="w3-large">
                                    <b>Delete:</b>
                                    Users are able to remove tasks.
                                </p>
                            </li>
                        </ol>
                        </p>
                    </li>
                    <li class="title-list">
                        <p class="w3-large">
                            <b>Task Filtering and Sorting:</b>
                        <ol>
                            <li>
                                <p>Filter tasks by status (e.g., Pending, In Progress, Completed).</p>
                            </li>
                            <li>
                                <p>Sort tasks by due date.</p>
                            </li>
                        </ol>
                        </p>
                    </li>
                </div>
            </div>
        </div>
        <hr>
        <!-- Menu Section -->
        <div class="w3-row w3-padding-64" id="menu">
            <div class="w3-col l6 w3-padding-large">
                <h1 class="w3-center">API Documentation</h1><br>
                <ol>
                    <li>JSON View</li>
                    <li>Graphical View</li>
                </ol>
            </div>

            <div class="w3-col l6 w3-padding-large">
                <h1>JSON View</h1><br>
                <iframe class="w

3-round w3-image w3-opacity-min" src="http://127.0.0.1:8000/docs/api.json"
                    name="iframe_a" style="height:80vh; width:100%;"></iframe>
            </div>
        </div>

        <hr>

        <!-- Contact Section -->
        <div class="w3-container w3-padding-64" id="contact">
            <h1>Graphical View</h1><br>
            <iframe class="w3-round w3-image w3-opacity-min" src="http://127.0.0.1:8000/docs/api#/" name="iframe_a"
                style="height:80vh; width:100%;"></iframe>
        </div>
    </div>

    <!-- Footer -->
    <footer class="w3-center w3-light-grey w3-padding-32">
        <p>Developed by
            <a href="https://github.com/Ahsanjuly29" title="Ahsan Github Link" target="_blank"
                class="w3-hover-text-green">
                Ahsan Ahmed
            </a>
        </p>
    </footer>
</body>

</html>
```

## 🔗 Resources

- [Laravel Documentation](https://laravel.com/docs/8.x)
- [Laravel Sanctum](https://laravel.com/docs/8.x/sanctum)
- [AJAX CRUD Tutorial](https://developer.mozilla.org/en-US/docs/Web/Guide/AJAX)
- [Yajra Datatables](https://yajrabox.com/docs/laravel-datatables)

## 📞 Support

For issues or further assistance, please feel free to reach out through the repository's issues section.
