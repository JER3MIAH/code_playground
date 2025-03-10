import 'package:todo_app/models/task.dart';

class TaskService {
  List<Task> tasks = [];

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
    print('Task added: $title');
  }

  void markTaskAsDone(int index) {
    if (!tasks.contains(tasks[index - 1])) {
      print('This task does not exist');
    } else {
      tasks[index - 1].toggleIsDone();
    }
  }

  void removeTask(int index) {
    if (!tasks.contains(tasks[index - 1])) {
      print('This task does not exist');
    } else {
      print("Task removed: ${tasks[index - 1].title}");
      tasks.removeAt(index - 1);
    }
  }
}
