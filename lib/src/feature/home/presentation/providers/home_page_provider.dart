
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo/src/feature/home/domain/task.dart';
import 'package:riverpod_todo/src/services/task_service.dart';

typedef HomePageState = ({List<Item> todos, bool isLoading});

final homePageControllerProvider =
    NotifierProvider<HomePageController, HomePageState>(HomePageController.new);

class HomePageController extends Notifier<HomePageState> {
  @override
  build() {
    final tasks = ref.watch(taskServiceProvider);

    return (todos: tasks.tasks, isLoading: false);
  }

  // void addTodo() async {
  //   // final previousTodos = state.todos;

  //   state = (todos: [], isLoading: true);

  //   ref.read(taskServiceProvider.notifier).createTask();

  //   // await Future.delayed(const Duration(seconds: 2));
  //   // final id = previousTodos.length + 1;
  //   // state = (
  //   //   todos: [
  //   //     ...previousTodos,
  //   //     Item(
  //   //       id: '$id',
  //   //       title: 'title $id',
  //   //       description: 'description $id',
  //   //       isCompleted: id %3 == 0 ? true : false,
  //   //     ),
  //   //   ],
  //   //   isLoading: false,
  //   // );
  // }
}
