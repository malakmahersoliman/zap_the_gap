import 'package:flutter/material.dart';
import 'package:zap_the_gap/db/user_db.dart';
import 'package:zap_the_gap/model/user.dart';

class UserController {
  final UserDb _userDb = UserDb();
  Future<void> registerUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final user = User(
      username: username,
      email: email,
      password: password
    );
    await _userDb.insertUser(user);
  }
  Future<List?> getAllUsers() async{
    return await _userDb.getAllUsers();
  }
  Future<User?> getUserById(int id) async{
    return await _userDb.getUserById(id);
  }
  Future<User?> getUserByEmail(String email) async{
    return await _userDb.getUserByEmail(email);
  }
  Future<void> deleteUser(int id) async{
    await _userDb.deleteUser(id);
  }
  Future<void> closeDatabase() async{
    await _userDb.closeDatabase();
  }
}