import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:zap_the_gap/model/task.dart';


class TaskDb {
  static final TaskDb _instance = TaskDb._internal();
  factory TaskDb() => _instance;
  Database? _database;

  TaskDb._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize database
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'tasks.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, description TEXT, dueDate TEXT, isCompleted INTEGER)',
      );
    }, version: 1);
  }

  // Insert a new task
  Future<void> insertTask(Task task) async {
    final db = await database;
    await db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get all tasks
  Future<List<Task>> getTasks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) {
      return Task.fromMap(maps[i]);
    });
  }

  // Update task completion status
  Future<void> updateTaskCompletion(int id, bool isCompleted) async {
    final db = await database;
    await db.update(
      'tasks',
      {'isCompleted': isCompleted ? 1 : 0},
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
