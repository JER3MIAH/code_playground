import 'package:todo_app/services/task_service.dart' as todo_app;
import 'package:todo_app/utils/utils.dart';

void main(List<String> arguments) {
  final app = todo_app.TaskService();

  while (true) {
    print("\nTo-Do CLI App");
    print("1. Add Task");
    print("2. List Tasks");
    print("3. Mark Task as Done");
    print("4. Remove Task");
    print("5. Exit");

    String? choice = IOHelper.getInput('Enter your choice: ');

    switch (choice) {
      case '1':
        String title = IOHelper.getInput('Enter task title: ');

        if (title.isNotEmpty) {
          app.addTask(title);
        }
        break;
      case '2':
        app.getAllTasks();
        break;
      case '3':
        String input = IOHelper.getInput('Enter task number to mark as done: ');
        int? index = int.tryParse(input);
        if (index != null) {
          app.markTaskAsDone(index);
        }
        break;
      case '4':
        String input = IOHelper.getInput('Enter task number to remove: ');
        int? taskNumber = int.tryParse(input);
        if (taskNumber != null) {
          app.removeTask(taskNumber);
        }
        break;
      case '5':
        print('Exiting... Goodbye.');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
