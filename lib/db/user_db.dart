import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/user.dart';

class UserDb {
    static final UserDb _instance = UserDb._internal();
    factory UserDb() => _instance;
    Database? _database;

    UserDb._internal();

    Future<Database> get database async {
        if (_database != null ) return _database!;
        _database = await _initDatabase();
        return _database!;
    }

    Future<Database> _initDatabase() async {
        String path = join(await getDatabasesPath(), 'users.db');
        return openDatabase(
            path,
            onCreate: (db, version){
                db.execute(
                    '''
                    CREATE TABLE users(
                    id integer PRIMARY KEY AUTOINCREMENT,
                    username TEXT NOT NULL,
                    email TEXT NOT NULL UNIQUE,
                    password TEXT NOT NULL)
                    ''',
                );
            },
            version: 1,
        );
    }
    Future<void> insertUser(User user) async{
        final db = await database;
        await db.insert(
            'users',
            user.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace,
        );
    }
    
    Future<List<User>> getAllUsers() async{
        final db = await database;
        final List<Map<String, dynamic>> maps = await db.query('users');
        return List.generate(maps.length, (i){
            return User.fromMap(maps[i]);
        });
    }
    Future<User?> getUserById(int id) async {
        final db = await database;
        final maps = await db.query(
            'users',
            where: 'id = ?',
            whereArgs: [id],
            limit: 1,
        );
        if (maps.isNotEmpty) {
            return User.fromMap(maps.first);
        }
        return null;
    }
    Future<User?> getUserByEmail(String email) async {
        final db = await database;
        final maps = await db.query(
            'users',
             where: 'email = ?',
             whereArgs: [email],
             limit: 1,
            );
        if (maps.isNotEmpty) {
            return User.fromMap(maps.first);
        }
        return null;
    }
    Future<void> deleteUser(int id) async {
        final db = await database;
            await db.delete(
            'users',
            where: 'id = ?',
            whereArgs: [id],
        );
  }

  Future<void> closeDatabase() async {
        final db = await database;
        await db.close();
        _database = null;
    } 

}