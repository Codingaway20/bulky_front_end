import 'package:bulky_front_end/Bulky.Controllers/HomeController.dart';
import 'package:bulky_front_end/Bulky.Views/Category/CategoryIndex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Bulky.Views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //putting home controller
    Get.put(HomeController());
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
