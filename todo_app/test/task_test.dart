import 'package:test/test.dart';
import 'package:todo_app/models/task.dart';

void main() {
  test('Task toggles status correctly', () {
    Task task = Task(title: 'Test Task', isDone: false);
    expect(task.isDone, false);

    task.toggleIsDone();
    expect(task.isDone, true);
  });
}
