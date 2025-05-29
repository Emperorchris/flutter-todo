import 'dart:convert';

import 'package:flutter/foundation.dart';

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

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'isCompleted': isCompleted});
  
    return result;
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, title: $title, description: $description, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Item &&
      other.id == id &&
      other.title == title &&
      other.description == description &&
      other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      isCompleted.hashCode;
  }
}







class Tasks {
  final List<Item> tasks;
  Tasks({
    required this.tasks,
  });

  Tasks copyWith({
    List<Item>? tasks,
  }) {
    return Tasks(
      tasks: tasks ?? this.tasks,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'tasks': tasks.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      tasks: List<Item>.from(map['tasks']?.map((x) => Item.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Tasks.fromJson(String source) => Tasks.fromMap(json.decode(source));

  @override
  String toString() => 'Tasks(tasks: $tasks)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Tasks &&
      listEquals(other.tasks, tasks);
  }

  @override
  int get hashCode => tasks.hashCode;
}
