// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/services/task_service.dart';

class CreateTaskState {
  final bool isLoading;
  final bool isNewTask;
  CreateTaskState({required this.isLoading, required this.isNewTask});

  CreateTaskState copyWith({bool? isLoading, bool? isNewTask}) {
    return CreateTaskState(
      isLoading: isLoading ?? this.isLoading,
      isNewTask: isNewTask ?? this.isNewTask,
    );
  }
}

final createTaskControllerProvider =
    NotifierProvider<CreateTaskController, CreateTaskState>(
      CreateTaskController.new,
    );

//create controller for this page using notifier

class CreateTaskController extends Notifier<CreateTaskState> {
  @override
  CreateTaskState build() {
    return CreateTaskState(isLoading: false, isNewTask: true);
  }

  Future<void> createTask(Item task) async {
    state = state.copyWith(isLoading: true);

    await ref.read(taskServiceProvider.notifier).createTask(task);

    state = state.copyWith(isLoading: false);
  }

  Future<void> updateTask(Item task) async {
    state = state.copyWith(isLoading: true);

    await ref.read(taskServiceProvider.notifier).updateTask(task);

    state = state.copyWith(isLoading: false);
  }
}
