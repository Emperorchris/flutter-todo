import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/providers/create_task_provider.dart';
import 'package:riverpod_todo/src/services/task_service.dart';


class CreateTaskPage extends ConsumerStatefulWidget {
  const CreateTaskPage({super.key});

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
    descriptionController.text = "hello";
    // titleController = TextEditingController();
    // descriptionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Create a New Task',
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

               await  ref
                    .read(createTaskControllerProvider.notifier)
                    .createTask(task);

                Navigator.pop(context); // Go back after creating the task
              },
              child:
                  ref.watch(createTaskControllerProvider)
                      ? const CircularProgressIndicator()
                      : const Text('Create Task'),
            ),
          ],
        ),
      ),
    );
  }
}
