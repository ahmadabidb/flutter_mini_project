import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/models/helper/database_helper.dart';
import 'package:flutter_diet_planner/models/progress_model.dart';
import 'package:intl/intl.dart';

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
