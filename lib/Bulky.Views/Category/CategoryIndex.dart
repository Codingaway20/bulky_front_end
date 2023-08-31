import 'package:bulky_front_end/Bulky.Controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Bulky,Widgets/NavigationBar.dart';
import '../../Bulky.Utilities/AppConstants.dart';

class CategoryIndex extends StatefulWidget {
  const CategoryIndex({super.key});

  @override
  State<CategoryIndex> createState() => _CategoryIndexState();
}

class _CategoryIndexState extends State<CategoryIndex> {
  final HomeController _homeController = Get.find();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //From here the elemnts of the Home Screen will be populated
        child: Container(
          width: AppConstants.screenWidth,
          child: Column(
            children: [
              NavBar(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
