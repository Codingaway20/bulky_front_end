import 'package:bulky_front_end/Controllers/CategoryController.dart';
import 'package:bulky_front_end/Controllers/HomeController.dart';
import 'package:bulky_front_end/Utilities/AppConstants.dart';
import 'package:bulky_front_end/Views/Product/ProductIndex.dart';
import 'package:bulky_front_end/Widgets/AppFonts.dart';
import 'package:bulky_front_end/Views/Category/CategoryIndex.dart';
import 'package:bulky_front_end/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Controllers/ProductController.dart';

class NavBar extends StatefulWidget {
  NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  HomeController _homeController = Get.find();
  CategoryController _categoryController = Get.find();
  final ProductController _productControoler = Get.find();

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext ctx) => Container(
        color: AppConstants.AppPrimaryColor,
        width: AppConstants.screenWidth,
        height: AppConstants.screenHeight! / 10,
        child: Row(
          children: [
            logoImage(),
            homeButton(),
            privacyButton(),
            const SizedBox(
              width: 30,
            ),
            const VerticalDivider(
              thickness: 1,
              color: Colors.black,
            ),
            categoryButton(),
            productButton(),
          ],
        ),
      ),
    );
  }

  Padding privacyButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {},
        child: AppFont(
          fontColor: Colors.white38,
          text: "Privacy",
          fontSize: 18,
        ),
      ),
    );
  }

  Padding homeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () {
          Get.off(
            () => Home(),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 800),
          );
        },
        child: AppFont(
          fontColor: Colors.white38,
          text: "Home",
          fontSize: 18,
        ),
      ),
    );
  }

  Padding categoryButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () async {
          //Populate categories
          await _categoryController.getAllCategories();
          //Go to Category Index view
          Get.off(
            () => CategoryIndex(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 800),
          );
        },
        child: AppFont(
          fontColor: Colors.white38,
          text: "Category",
          fontSize: 18,
        ),
      ),
    );
  }

  Padding productButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: () async {
          await _productControoler.getAllProducts();
          Get.off(
            () => ProductIndex(),
            transition: Transition.rightToLeftWithFade,
            duration: const Duration(milliseconds: 800),
          );
        },
        child: AppFont(
          fontColor: Colors.white38,
          text: "Product",
          fontSize: 18,
        ),
      ),
    );
  }

  Padding logoImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 50,
        height: 50,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "images/book.png",
            ),
          ),
        ),
      ),
    );
  }
}
