import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/create_task_page.dart';
import 'package:riverpod_todo/src/feature/home/presentation/providers/home_page_provider.dart';
import 'package:riverpod_todo/src/feature/home/presentation/widgets/no_task_body.dart';
import 'package:riverpod_todo/src/feature/home/presentation/widgets/task_body.dart';
import 'package:riverpod_todo/src/services/task_service.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homePageControllerProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Simple Task Manager')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child:
                  state.todos.isEmpty
                      ? NoTaskBody()
                      : TaskBody(todos: state.todos),
            ),
          ),

          if (state.isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(homePageControllerProvider.notifier).addTodo();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateTaskPage()),
          );
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
