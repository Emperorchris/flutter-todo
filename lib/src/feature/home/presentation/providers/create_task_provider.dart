import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/services/task_service.dart';

final createTaskProvider = NotifierProvider<TaskService, Tasks>(
  TaskService.new,
);
