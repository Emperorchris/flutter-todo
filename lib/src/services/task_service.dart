import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/feature/home/presentation/providers/create_task_provider.dart';

final taskServiceProvider =
    AsyncNotifierProvider.autoDispose<TaskService, Tasks>(TaskService.new);

class TaskService extends AutoDisposeAsyncNotifier<Tasks> {
  KeepAliveLink? link;
  @override
  Future<Tasks> build() async {
    link = ref.keepAlive();

    ref.onResume(() {
      link = null;
    });

    ref.onCancel(() {
      Timer(Duration(minutes: 10), () => link?.close());
    });

    return Tasks(tasks: []);
  }

  //id : 'id'
  Future<Tasks> createTask(Item task) async {
    await future;

    state = AsyncValue.loading();

    state = AsyncValue<Tasks>.loading().copyWithPrevious(state);

    ///State<Tasks>
    ///AsyncData -> Tasks
    ///AsyncLoading -> loading == true
    ///AsyncError -> error, stacktrace
    ///
    ///AsyncValue Functions
    ///hasValue, hasError, isLoading, isLoading, isRefreshing
    ///
    ///maybeWhen, whenData, maybeMap
    ///
    ///
    ///AuthService - userService - TaskService
    ref.invalidateSelf();
    final value = ref.refresh(taskServiceProvider);
    ref.invalidate(taskServiceProvider);

    ref.listen(createTaskControllerProvider, ((previous, next) {
      //funcitonality
    }));

    state.when(
      data: (data) => ListView(),
      error: (error, s) => Text(""),
      loading: () => CircularProgressIndicator(),
    );

    if (state.hasError) throw state.error!;

    final newTask = task.copyWith(id: "${state.requireValue.tasks.length + 1}");
    state = AsyncData(
      state.requireValue.copyWith(
        tasks: [...state.requireValue.tasks, newTask],
      ),
    );
    //wait 5 secs
    await Future.delayed(const Duration(seconds: 2));

    return state.value!;
  }

  Future<Tasks> deleteTask(String taskId) async {
    state = AsyncData(
      state.requireValue.copyWith(
        tasks:
            state.requireValue.tasks
                .where((task) => task.id != taskId)
                .toList(),
      ),
    );

    return state.requireValue;
  }

  Future<Tasks> updateTask(Item task) async {
    await Future.delayed(const Duration(seconds: 2));

    state = AsyncData(
      state.requireValue.copyWith(
        tasks:
            state.requireValue.tasks
                .map((t) => t.id == task.id ? task : t)
                .toList(),
      ),
    );

    return state.requireValue;
  }
}
