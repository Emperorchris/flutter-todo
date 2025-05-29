import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/providers/create_task_provider.dart';

class EditTaskPage extends ConsumerStatefulWidget {
  final Item task;
  const EditTaskPage({super.key, required this.task});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends ConsumerState<EditTaskPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // update the state of the controller

    //initialize the widget text from the task editing
    descriptionController.text = widget.task.description;
    titleController.text = widget.task.title;
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
      appBar: AppBar(title: const Text('Edit Task')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Edit Task',
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
                  id: widget.task.id,
                  title: titleController.text,
                  description: descriptionController.text,
                  isCompleted: false,
                );

                await ref
                    .read(createTaskControllerProvider.notifier)
                    .updateTask(task);

                Navigator.pop(context); // Go back after creating the task
              },
              child:
                  ref.watch(createTaskControllerProvider).isLoading
                      ? const CircularProgressIndicator()
                      : const Text('Edit Task'),
            ),
          ],
        ),
      ),
    );
  }
}
