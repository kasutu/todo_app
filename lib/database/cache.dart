import 'package:todo_app/models/task_model.dart';

class TaskModelCache {
  static const int _capacity = 100; // Set a default capacity
  static final List<TaskModel> _cache = [];

  static void add(TaskModel task) {
    if (_cache.length >= _capacity) {
      _cache.removeAt(0);
    }
    _cache.add(task);
  }

  static TaskModel? pop() {
    if (_cache.isNotEmpty) {
      return _cache.removeLast();
    }
    return null;
  }

  static bool isEmpty() {
    return _cache.isEmpty;
  }
}
