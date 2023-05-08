import 'package:flutter/material.dart';
import 'package:flutter_diet_planner/models/db_manager.dart';
import 'package:flutter_diet_planner/views/provider/progress_provider.dart';
import 'package:flutter_diet_planner/views/screens/onboard.dart';
import 'package:flutter_diet_planner/views/screens/onboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProgressProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const OnBoard(),
      ),
    );
  }
}
