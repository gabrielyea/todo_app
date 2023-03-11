import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/providers.dart';

class AddTaskScreen extends ConsumerStatefulWidget {
  const AddTaskScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends ConsumerState<AddTaskScreen> {
  String taskName = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Gap(20),
          const Text(
            "Add Task",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30, color: Colors.lightBlue),
          ),
          TextField(
            onChanged: (value) {
              taskName = value;
            },
            autofocus: true,
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue, width: 5),
              ),
            ),
          ),
          const Gap(20),
          ElevatedButton(
            onPressed: () {
              Task newTask = Task(name: taskName);
              ref.read(taskListProvider.notifier).addTask(newTask);
              Navigator.pop(context);
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
