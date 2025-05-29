import 'package:flutter/material.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/edit_task_page.dart';

class TaskBody extends StatelessWidget {
  const TaskBody({super.key, required this.todos});

  final List<Item> todos;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditTaskPage(task: todos[index]),
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(child: Text(todos[index].id)),
            title: Text(todos[index].title),
            subtitle: Text(todos[index].description),
            trailing: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (value) {},
            ),
          ),
        );
      },
    );
  }
}
