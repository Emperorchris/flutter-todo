import 'package:flutter/material.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key, required this.todos});

  final List<Item> todos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          subtitle: Text(todos[index].description),
          trailing: Checkbox(
            value: todos[index].isCompleted,
            onChanged: (value) {},
          ),
        );
      },
    );
  }
}
