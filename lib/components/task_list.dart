import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers.dart';

import 'tile_item.dart';

class TaskListWidget extends ConsumerStatefulWidget {
  const TaskListWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends ConsumerState<TaskListWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   final myList = ref.read(taskListProvider);
  //   print(myList);
  // }

  @override
  Widget build(BuildContext context) {
    final myList = ref.watch(taskListProvider) as List<Task>;
    return ListView.builder(
      itemCount: myList.length,
      itemBuilder: (context, index) {
        final task = myList[index];
        return TileItem(
          title: task.name,
          checked: task.isDone,
          onChange: (bool value) {
            ref.read(taskListProvider.notifier).toggleTask(task);
          },
        );
      },
    );
  }
}
