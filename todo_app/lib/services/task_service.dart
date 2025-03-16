import 'dart:convert';
import 'dart:io';

import 'package:todo_app/models/task.dart';

class TaskService {
  List<Task> tasks = [];
  final String filePath = 'tasks.json';

  TaskService() {
    _loadTasks();
  }

  void getAllTasks() {
    if (tasks.isEmpty) {
      print('No tasks available');
    } else {
      for (var i = 0; i < tasks.length; i++) {
        print('${i + 1}. ${tasks[i]}');
      }
    }
  }

  void addTask(String title) {
    tasks.add(Task(title: title, isDone: false));
    _saveTasks();
    print('Task added: $title');
  }

  void markTaskAsDone(int index) {
    if (!tasks.contains(tasks[index - 1])) {
      print('This task does not exist');
    } else {
      tasks[index - 1].toggleIsDone();
      _saveTasks();
    }
  }

  void removeTask(int index) {
    if (!tasks.contains(tasks[index - 1])) {
      print('This task does not exist');
    } else {
      print("Task removed: ${tasks[index - 1].title}");
      tasks.removeAt(index - 1);
      _saveTasks();
    }
  }

  void _saveTasks() {
    File file = File(filePath);
    List<dynamic> jsonData = tasks.map((task) => task.toJson()).toList();
    file.writeAsStringSync(jsonEncode(jsonData));
  }

  void _loadTasks() {
    File file = File(filePath);
    if (file.existsSync()) {
      List<dynamic> jsonData = jsonDecode(file.readAsStringSync());
      tasks = jsonData.map((task) => Task.fromJson(task)).toList();
    }
  }
}
