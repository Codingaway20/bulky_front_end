import 'package:bulky_front_end/Bulky.Controllers/CategoryController.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:bulky_front_end/Bulky.Views/Category/CategoryCreate.dart';
import 'package:bulky_front_end/Bulky.Widgets/AppFonts.dart';
import 'package:bulky_front_end/Bulky.Widgets/NavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryIndex extends StatefulWidget {
  const CategoryIndex({super.key});

  @override
  State<CategoryIndex> createState() => _CategoryIndexState();
}

class _CategoryIndexState extends State<CategoryIndex> {
  final CategoryController _categoryController = Get.find();

  List<Container> allContainers = [];
  bool isLoaded = false;

  @override
  void initState() {
    allContainers = _categoryController.getAllCategoriesViews();
    setState(() {
      isLoaded = true;
    });
    super.initState();
  }

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppFont(
                    text: "Category List",
                    fontColor: AppConstants.AppPrimaryColor,
                    isBold: true,
                    fontSize: AppConstants.screenTtileSize,
                  ),
                  SizedBox(
                    width: AppConstants.screenWidth! / 20,
                  ),
                  createCategoryButton(),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: AppConstants.screenWidth! / 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AppFont(
                        text: "Category name",
                        fontColor: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AppFont(
                        text: "Display Order",
                        fontColor: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: AppFont(
                        text: "Actions",
                        fontColor: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              //=======================
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: allContainers,
              )
            ],
          ),
        ),
      ),
    );
  }

  InkWell createCategoryButton() {
    return InkWell(
      onTap: () {
        Get.to(
          () => CategoryCreate(),
          transition: Transition.fade,
        );
      },
      child: Container(
        color: AppConstants.AppPrimaryColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFont(
                text: "Create new Category",
                fontColor: Colors.white,
                fontSize: 15,
              ),
              const Icon(
                Icons.add,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
