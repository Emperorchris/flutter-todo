import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/services/task_service.dart';
final createTaskControllerProvider =
    NotifierProvider<CreateTaskController, bool>(CreateTaskController.new);

//create controller for this page using notifier

class CreateTaskController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  Future<void> createTask(Item task) async {
    state = true;

    await ref.read(taskServiceProvider.notifier).createTask(task);

    state = false;
  }
}
