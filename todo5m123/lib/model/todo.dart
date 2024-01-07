class Todo{
  String? id;
  String? task;
  bool isDone;

  Todo({
    required this.id,
    required this.task,
    this.isDone = false
});

  static List<Todo> todoList() {
    return [
      Todo(id: '1', task: 'Data Report'),
      Todo(id: '2',task: 'Go to gym'),
      Todo(id: '3',task: 'Visit hospital', isDone: true),
      Todo(id: '4',task: 'Fill the form', isDone: true)
    ];
  }
}