# ProjectFlow
## Project & Task Management

ProjectFlow is a full-featured project management system I built with Ruby on Rails 8, Turbo and TailwindCSS. It enables teams to collaborate on projects, manage tasks, assign work, comment in real-time, and track deadlines through the dashboard.

---
## Features

### User Accounts & Permissions

* Authentication with Devise
* User roles: **admin, manager, member**
* Role-based access using Pundit

### Project Management

* Create, update, and archive projects
* Overview dashboard with task statistics
* Activity feed for recent changes

### Task Management

* Assign tasks to users
* Status workflows (to-do, in progress, completed)
* Deadlines and priority levels
* Real-time comments using Turbo Streams
* In-App notifications

### Communication

* Task comments with live updates
* Email notifications for assignments
* Background jobs for daily summaries

### Planning tools

* Calendar view (Monthly, weekly)
* Due date highlighting
* Overdue task visualization

### Real Time Experience
* ActionCable integration
* Turbo Streams for instant updates across the application

## Tech Stack

* Ruby on Rails 8
* PostgreSQL
* TailwindCSS
* Turbo & Stimulus
* Sidekiq or ActiveJob for background jobs
* ActionCable for real-time features
* Kamal for deployment - Will be hosted on a Hetzner machine.

## Architechture Overview

### Core Models
* User
* Project
* Task
* Comment
* Notification

### Key Concepts
* Users own projects
* Tasks belong to projects
* Tasks can be assigned to any user
* Users receive notifications when changes occur
* Real-time interactions via turbo streams

## Running the project

### Requirements
* Ruby 3.3+
* Rails 8+
* PostgreSQL 14+
* Redis (for ActionCable & Background jobs)
* Node & npm/yarn

### Setup
```bash
git clone https://github.com/NikoDyring/project_flow.git
cd project_flow

bin/setup
bin/dev
```

This runs:
* Migrations
* Seed data
* Tailwind build
* esbuild watcher
* Rails server
* ActionCable

Access the app at:  
`http://localhost:3000`

### Running specs
`bin/rails exec rspec`

### Screenshots
Will be added eventually

### Roadmap
The main use of the application is for my portfolio for now, but in the future some other tasks to improve the app could be:

* Subtasks
* File uploads on tasks
* Team performance metrics
* User-to-user messaging

### License
MIT License