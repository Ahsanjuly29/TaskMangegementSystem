# Task Management System(API Development)

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [API Features](#api-features)
- [Filter](#filter)
- [Technologies Used](#technologies-used)
- [Installation](#installation)
- [Usage](#usage)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## Overview
The **Task Management System** is a web-based application designed to help users manage tasks effectively. It is built to cater to both individual users and teams by providing an organized interface to create, assign, and track tasks with ease. This application ensures that users stay on top of their responsibilities and deadlines, contributing to improved productivity and efficiency.

## Features
- User Authentication (Login/Registration)
- Create, Update, and Delete Tasks
- Assign tasks to users
- Set due dates and priorities for tasks
- Task progress tracking (e.g., In Progress, Completed)
- Search and filter tasks based on criteria such as status, due date, or priority
- User role management (Admin, User)
  - Admins can manage users and tasks across the platform
- Notifications for upcoming task deadlines
- View and manage task lists in an organized dashboard
- Responsive UI for mobile and desktop users

## API Features
This API provides the following features for users:

1. **Add New Tasks**: Users can create and add new tasks for themselves.
2. **View Task List**: Users can view a list of all their tasks.
3. **Edit Tasks**: Users can edit existing tasks.
4. **Remove Tasks**: Users can delete their tasks.

## Filter
1. Tasks can be filtered by their status (e.g., Pending, In Progress, Completed).
2. All tasks are sorted by their due date for easy viewing.

## Technologies Used
- **Backend**: Laravel (PHP framework)
- **Frontend**: Blade templating engine, HTML, CSS, JavaScript
- **Database**: MySQL
- **API Documentation**: Swagger/OpenAPI
- **Version Control**: Git and GitHub

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Ahsanjuly29/TaskMangegementSystem.git
   ```

2. Navigate to the project directory:

   ```bash
   cd TaskMangegementSystem
   ```

3. Install dependencies:

   ```bash
   composer install
   npm install
   ```

4. Copy the `.env` file and update your environment variables:

   ```bash
   copy .env.example to .env
   ```

   Update the `.env` file with your database information and other configurations.

5. Generate the application key:

   ```bash
   php artisan key:generate
   ```

6. Run the migrations and seed the database:

   ```bash
   php artisan migrate --seed
   ```

7. Serve the application:

   ```bash
   php artisan serve
   ```

## Usage

1. Register a new user or log in with an existing account.
2. Create new tasks, assign them to users, set deadlines, and track their progress.
3. Admin users can manage other users and oversee the task management system.

## Documentation

- **UI View**: [API Documentation (UI)](http://127.0.0.1:8000/docs/api)  
  *(e.g., http://127.0.0.1:8000/docs/api#/)*

- **JSON View**: [API Documentation (JSON)](http://127.0.0.1:8000/docs/api.json)  
  *(e.g., http://127.0.0.1:8000/docs/api.json)*

## Postman Collection

All API endpoints and workflows can be tested using the provided Postman collection. The collection is stored in the repository in the `All Collection Data` folder.

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes and push to your forked repository.
4. Submit a pull request describing your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
