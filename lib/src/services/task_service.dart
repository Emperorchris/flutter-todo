import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';

final taskServiceProvider = NotifierProvider<TaskService, Tasks>(
  TaskService.new,
);

class TaskService extends Notifier<Tasks> {
  @override
  build() {
    return Tasks(tasks: []);
  }

  Future<Tasks> createTask(Item task) async {
    task.copyWith(id: "${state.tasks.length + 1}");
    state = state.copyWith(tasks: [...state.tasks, task]);
    //wait 5 secs
    await Future.delayed(const Duration(seconds: 5));
    return Future.value(state);
  }

  Future<Tasks> deleteTask(String taskId) {
    state = state.copyWith(
      tasks: state.tasks.where((task) => task.id != taskId).toList(),
    );

    return Future.value(state);
  }

  Future<Tasks> updateTask(Item task) async {
    await Future.delayed(const Duration(seconds: 2));

    state = state.copyWith(
      tasks: state.tasks.map((t) => t.id == task.id ? task : t).toList(),
    );

    return Future.value(state);
  }
}
