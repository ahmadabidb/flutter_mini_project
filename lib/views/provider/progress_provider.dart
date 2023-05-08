import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/models/db_manager.dart';
import 'package:flutter_diet_planner/models/helper/database_helper.dart';
import 'package:flutter_diet_planner/models/progress_model.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

// class ProgressProvider with ChangeNotifier {
//   // final formKey = GlobalKey<FormState>();

//   // DateTime selectedDate = DateTime.now();
//   // TextEditingController weightController = TextEditingController();
//   // TextEditingController heightController = TextEditingController();

//   // List<Progress> progressList = [];
//   // DBManager dbManager = DBManager();

//   // ProgressProvider() {
//   //   loadProgressList();
//   // }

//   // loadProgressList() async {
//   //   List<Progress> progressList = await dbManager.getAllProgress();

//   //   progressList = progressList;
//   //   notifyListeners();
//   // }

//   // saveProgress() async {
//   //   if (formKey.currentState!.validate()) {
//   //     double weight = double.parse(weightController.text);
//   //     double height = double.parse(heightController.text);
//   //     String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

//   //     Progress progress = Progress(
//   //       date: formattedDate,
//   //       weight: weight,
//   //       height: height,
//   //     );

//   //     await dbManager.insert(progress);
//   //     loadProgressList();
//   //     clearForm();
//   //   }
//   // }

//   // deleteProgress(Progress progress) async {
//   //   await dbManager.delete(progress.id!);
//   //   loadProgressList();
//   // }

//   // clearForm() {
//   //   selectedDate = DateTime.now();
//   //   weightController.text = '';
//   //   heightController.text = '';
//   // }

//   // DatabaseHelper databaseHelper = DatabaseHelper.instance;

//   // Future<int> insert(Progress progress) async {
//   //   Database db = await databaseHelper.database;
//   //   return await db.insert(DatabaseHelper.table, progress.toMap());
//   // }

//   // Future<List<Progress>> getAllProgress() async {
//   //   Database db = await databaseHelper.database;
//   //   List<Map<String, dynamic>> maps = await db.query(DatabaseHelper.table);
//   //   return List.generate(maps.length, (i) {
//   //     return Progress.fromMap(maps[i]);
//   //   });
//   // }

//   // Future<int> update(Progress progress) async {
//   //   Database db = await databaseHelper.database;
//   //   return await db.update(DatabaseHelper.table, progress.toMap(),
//   //       where: '${DatabaseHelper.columnId} = ?', whereArgs: [progress.id]);
//   // }

//   // Future<int> delete(int id) async {
//   //   Database db = await databaseHelper.database;
//   //   return await db.delete(DatabaseHelper.table,
//   //       where: '${DatabaseHelper.columnId} = ?', whereArgs: [id]);
//   // }
// }

class ProgressProvider extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  List<Progress> listprogress = [];

  late final DatabaseHelper _dbHelper;

  ProgressProvider() {
    _dbHelper = DatabaseHelper();
    _getAllProgress();
  }

  void _getAllProgress() async {
    listprogress = await _dbHelper.getProgress();
    notifyListeners();
  }

  addProgress() async {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);

    Progress progress = Progress(
      date: formattedDate,
      weight: weight,
      height: height,
    );

    await _dbHelper.insertProgress(progress);
    _getAllProgress();
  }

  void updateProgress(Progress progress) async {
    await _dbHelper.updateProgress(progress);
    _getAllProgress();
  }

  deleteProgress(int id) async {
    await _dbHelper.deteleProgress(id);
    _getAllProgress();
  }
}
