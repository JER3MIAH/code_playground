# To-Do CLI App

## Overview

The **To-Do CLI App** is a simple command-line application built with **Dart** that allows users to manage their tasks efficiently. Users can add tasks, list them, mark tasks as done, and remove tasks.

## Features

- Add new tasks.
- List all tasks.
- Mark tasks as done.
- Remove tasks.
- User-friendly CLI interaction.

## Requirements

- Dart SDK installed on your system.
- A terminal or command prompt to run the application.

## Installation

1. **Clone the Repository** (or create the Dart file manually):
   ```sh
   git clone <repository-url>
   cd todo_cli
   ```
2. **Ensure Dart is installed:**
   ```sh
   dart --version
   ```
3. **Run the Application:**
   ```sh
   dart todo_cli.dart
   ```

## Usage

When you run the application, you will see a menu with options:

```
To-Do CLI App
1. Add Task
2. List Tasks
3. Mark Task as Done
4. Remove Task
5. Exit
Enter your choice:
```

### **Adding a Task**

Choose option `1`, then enter the task title when prompted.

### **Listing Tasks**

Choose option `2` to see the list of tasks.

### **Marking a Task as Done**

Choose option `3`, then enter the task number to mark it as done.

### **Removing a Task**

Choose option `4`, then enter the task number to remove it.

### **Exiting the App**

Choose option `5` to exit the application.

## Example Session

```
To-Do CLI App
1. Add Task
2. List Tasks
3. Mark Task as Done
4. Remove Task
5. Exit
Enter your choice: 1
Enter task title: Buy groceries
Task added: Buy groceries

Enter your choice: 2
0. [ ] Buy groceries

Enter your choice: 3
Enter task number to mark as done: 0
Task updated: [✔] Buy groceries

Enter your choice: 4
Enter task number to remove: 0
Task removed: Buy groceries

Enter your choice: 5
Exiting... Goodbye!
```
