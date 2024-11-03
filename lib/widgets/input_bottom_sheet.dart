import 'package:flutter/material.dart';

void showAddTaskSheet(BuildContext context, Function(String) onAddTask) {
  final TextEditingController titleController = TextEditingController();

  showModalBottomSheet(
    showDragHandle: true,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          spacing: 32,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Whats the task?',
              ),
            ),
            Row(
              spacing: 18,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        final String title = titleController.text;
                        if (title.isNotEmpty) {
                          onAddTask(title);
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        'Add',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}
