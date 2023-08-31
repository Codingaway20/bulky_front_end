import 'package:bulky_front_end/Bulky.Controllers/HomeController.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:bulky_front_end/Bulky,Widgets/NavigationBar.dart';
import 'package:bulky_front_end/Bulky,Widgets/ProductView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    AppConstants.screenHeight = MediaQuery.of(context).size.height;
    AppConstants.screenWidth = MediaQuery.of(context).size.width;
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
              Wrap(
                spacing: 30,
                children: [
                  ProductView(),
                  ProductView(),
                  ProductView(),
                  ProductView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
