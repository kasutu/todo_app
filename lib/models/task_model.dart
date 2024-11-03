class TaskModel {
  final String id;
  final String title;
  bool isDone;
  bool isArchived;

  TaskModel({
    required this.id,
    required this.title,
    this.isDone = false,
    this.isArchived = false,
  });

  TaskModel copyWith({
    String? id,
    String? title,
    bool? isDone,
    bool? archived,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      isArchived: archived ?? isArchived,
    );
  }

  @override
  String toString() {
    return 'TaskModel{id: $id, title: $title, isDone: $isDone, isArchived: $isArchived}';
  }
}
