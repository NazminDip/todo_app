class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });
  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morining Excercise', isDone: true),
      ToDo(id: '02', todoText: 'Study ', isDone: true),
      ToDo(id: '03', todoText: 'Breakfast', isDone: true),
      ToDo(
        id: '04',
        todoText: 'work on Apps',
      ),
      ToDo(
        id: '05',
        todoText: 'Meeting',
      ),
      ToDo(
        id: '06',
        todoText: 'Homework',
      ),
      ToDo(id: '07', todoText: 'Prayers ', isDone: true),
    ];
  }
}
