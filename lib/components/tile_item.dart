import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/providers.dart';

class TileItem extends ConsumerWidget {
  final String title;
  final bool checked;
  final Function onChange;
  const TileItem({super.key, required this.title, required this.checked, required this.onChange, required});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Text(title),
        Checkbox(
          value: checked,
          onChanged: (value) {
            onChange(value);
          },
        ),
        IconButton(
            onPressed: () {
              ref.read(taskListProvider.notifier).delteTaskByName(title);
            },
            icon: const Icon(Icons.delete),
            color: Colors.red),
      ],
    );
  }
}
