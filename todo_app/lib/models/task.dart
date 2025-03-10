class Task {
  String title;
  bool isDone;

  Task({
    required this.title,
    required this.isDone,
  });

  Task copyWith({
    String? title,
    bool? isDone,
  }) {
    return Task(
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
    );
  }

  @override
  String toString() => '${isDone ? '[✔]' : '[ ]'} $title';

  void toggleIsDone() {
    isDone = !isDone;
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.title == title && other.isDone == isDone;
  }

  @override
  int get hashCode => title.hashCode ^ isDone.hashCode;
}
