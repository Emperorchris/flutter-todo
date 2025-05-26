class Item {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  Item({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
  });

  Item copyWith({
    String? id,
    String? title,
    String? description,
    bool? isCompleted,
  }) {
    return Item(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class Tasks {
  final List<Item> tasks;
  Tasks({required this.tasks});

  Tasks copyWith({List<Item>? tasks}) {
    return Tasks(tasks: tasks ?? this.tasks);
  }
}
