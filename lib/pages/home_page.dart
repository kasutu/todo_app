import 'package:flutter/material.dart';
import 'package:todo_app/database/cache.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/widgets/input_bottom_sheet.dart';
import 'package:todo_app/widgets/todo_tile.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TaskModel> tasks = [
    TaskModel(title: 'Sample Task 1', id: '1', isDone: false),
    TaskModel(title: 'Sample Task 2', id: '2', isDone: false),
    TaskModel(title: 'Sample Task 3', id: '3', isDone: true),
    TaskModel(title: 'Sample Task 4', id: '4', isDone: false),
    TaskModel(title: 'Sample Task 5', id: '5', isDone: true),
  ];

  void handleDelete(String taskId) {
    setState(() {
      TaskModel task = tasks.firstWhere((task) => task.id == taskId);
      task.isArchived = true;
      TaskModelCache.add(task);
    });
  }

  void handleUndo() {
    setState(() {
      final TaskModel? prevTask = TaskModelCache.pop();
      if (prevTask != null) {
        prevTask.isArchived = false;
        int index = tasks.indexWhere((task) => task.id == prevTask.id);
        if (index != -1) {
          tasks[index] = prevTask;
        }
      }
    });
  }

  void handleCheckboxChanged(String taskId) {
    setState(() {
      TaskModel task = tasks.firstWhere((task) => task.id == taskId);
      task.isDone = !task.isDone;
    });
  }

  void addTask(String title) {
    setState(() {
      tasks.add(TaskModel(
        title: title,
        id: const Uuid().v4(),
        isDone: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Todo List', style: Theme.of(context).textTheme.titleLarge),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: TaskModelCache.isEmpty() ? null : handleUndo,
            icon: const Icon(Icons.undo),
            disabledColor: Theme.of(context).colorScheme.shadow,
          ),
        ],
        actionsIconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final TaskModel currentTask = tasks[index];
          return currentTask.isArchived
              ? const SizedBox.shrink()
              : TodoTile(
                  task: currentTask,
                  onDelete: handleDelete,
                  onChecked: handleCheckboxChanged,
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddTaskSheet(context, addTask),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: const Icon(Icons.add),
      ),
    );
  }
}
