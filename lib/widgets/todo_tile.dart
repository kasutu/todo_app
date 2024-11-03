import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/task_model.dart';

class TodoTile extends StatefulWidget {
  final TaskModel task;
  final ValueChanged<String> onDelete;
  final ValueChanged<String> onChecked;

  const TodoTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onChecked,
  });

  @override
  TodoTileState createState() => TodoTileState();
}

class TodoTileState extends State<TodoTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.task.isDone;
  }

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
      final updatedTask = widget.task.copyWith(isDone: _isChecked);
      widget.onChecked(updatedTask.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) => widget.onDelete(widget.task.id),
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Checkbox(
              side: BorderSide(color: colorScheme.secondary),
              value: _isChecked,
              onChanged: _onCheckboxChanged,
            ),
            title: Text(
              widget.task.title,
              style: theme.textTheme.bodyMedium?.copyWith(
                decoration: _isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: colorScheme.secondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
