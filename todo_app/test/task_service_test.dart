import 'package:test/test.dart';
import 'package:todo_app/services/task_service.dart';

void main() {
  test('Task is added successfully', () {
    var taskService = TaskService();
    taskService.addTask('New Task');

    expect(taskService.tasks.length, 1);
    expect(taskService.tasks[0].title, 'New Task');
  });
}
