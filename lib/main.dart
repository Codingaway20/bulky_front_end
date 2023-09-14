import 'package:bulky_front_end/Controllers/CategoryController.dart';
import 'package:bulky_front_end/Controllers/HomeController.dart';
import 'package:bulky_front_end/Services/DependencyInjection.dart';
import 'package:bulky_front_end/Views/Category/CategoryIndex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Views/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await putControllers();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
