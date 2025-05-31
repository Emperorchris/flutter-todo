import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/providers/create_task_provider.dart';
import 'package:riverpod_todo/src/services/task_service.dart';

class CreateTaskPage extends ConsumerStatefulWidget {
  final Item? item;
  const CreateTaskPage({super.key, this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends ConsumerState<CreateTaskPage> {
  //create text editing contrllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // update the state of the controller

    //initialize the widget text from the task editing
    descriptionController.text = widget.item?.description ?? '';
    titleController.text = widget.item?.title ?? '';
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //use the state of controller to know if the task is created or not
    //build the ui appriopriately
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item == null ? 'Create Task' : 'Edit Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.item == null ? 'Create a New Task' : 'Edit Task',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Task Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Task Description',
                border: OutlineInputBorder(),
              ),
              maxLines: 6,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Logic to create a new task goes here
                final task = Item(
                  id: 'id',
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: false,
                );

                if (widget.item == null) {
                  await ref
                      .read(createTaskControllerProvider.notifier)
                      .createTask(task);
                } else {
                  await ref
                      .read(createTaskControllerProvider.notifier)
                      .updateTask(task);
                }

                Navigator.pop(context); // Go back after creating the task
              },
              child:
                  ref.watch(createTaskControllerProvider).isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                        widget.item == null ? 'Create Task' : 'Update Task',
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
