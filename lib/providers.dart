import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';

final repoListProvider = Provider((ref) => TasksRepository());

class TasksRepository {
  List<Task> tasks = [];
}

final taskListProvider = StateNotifierProvider(
  (ref) {
    final repo = ref.read(repoListProvider);
    return TaskList(repo);
  },
);

class TaskList extends StateNotifier<List<Task>> {
  final TasksRepository tRepo;
  TaskList(this.tRepo) : super([]);

  void addTask(Task task) {
    state = [...state, task];
    tRepo.tasks.add(task);
  }

  void toggleTask(Task task) {
    state = state.map<Task>((t) {
      if (t == task) {
        t.toggleState();
      }
      return t;
    }).toList();
    tRepo.tasks = state;
  }

  void deleteTask(Task task) {
    state = state.where((t) => t != task).toList();
    tRepo.tasks = state;
  }

  void deleteAllTasks() {
    state = [];
    tRepo.tasks = state;
  }

  void delteTaskByName(String name) {
    state = state.where((t) => t.name != name).toList();
    tRepo.tasks = state;
  }

  List<Task> get allTasks => state;
}
