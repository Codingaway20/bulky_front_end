import 'package:bulky_front_end/Bulky.Controllers/CategoryController.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:bulky_front_end/Bulky.Views/Category/CategoryIndex.dart';
import 'package:bulky_front_end/Bulky.Widgets/AppFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Bulky.Widgets/NavigationBar.dart';

class CategoryCreate extends StatefulWidget {
  const CategoryCreate({super.key});

  @override
  State<CategoryCreate> createState() => _CategoryCreateState();
}

class _CategoryCreateState extends State<CategoryCreate> {
  //Category controller
  final CategoryController _categoryController = Get.find();
  //Text fileds controller
  final TextEditingController _name = TextEditingController();
  final TextEditingController _displayOrder = TextEditingController();

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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.inbox),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: AppFont(
                        text: "Name",
                        fontSize: 20,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _displayOrder,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.numbers),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: AppFont(
                        text: "Display order",
                        fontSize: 20,
                      )),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              createCategoryButton(),
            ],
          ),
        ),
      ),
    );
  }

  InkWell createCategoryButton() {
    return InkWell(
      onTap: () async {
        //check feilds if empty
        if (_name.text.isEmpty || _displayOrder.text.isEmpty) {
          Get.showSnackbar(const GetSnackBar(
            title: "Input error",
            message: "Please fill all the fields",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ));
          return;
        }
        //check if name and order are same
        if (_name.text == _displayOrder.text) {
          Get.showSnackbar(const GetSnackBar(
            title: "Input error",
            message: "Name and Display order shoud not be the same",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ));
          return;
        }
        if (!_displayOrder.text.isNum) {
          Get.showSnackbar(const GetSnackBar(
            title: "Input error",
            message: "Display order should be number !",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ));
          return;
        }

        //Create Category
        Category _newCategory = Category(
            Id: 0,
            Name: _name.text.trim(),
            DisplayOrder: int.parse(_displayOrder.text.trim()));

        //call controller to add the category
        bool addCategoryResult =
            await _categoryController.addNewCategory(_newCategory);
        //Success
        if (addCategoryResult) {
          Get.showSnackbar(const GetSnackBar(
            message: "Category has been added successfully",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ));
          Get.off(
            ()=> CategoryIndex(),
            transition: Transition.fade,
          );
          return;
        } else {
          Get.showSnackbar(const GetSnackBar(
            title: "Creation error",
            message: "operation failed , check API ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            duration: Duration(seconds: 2),
          ));
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Container(
          width: AppConstants.screenWidth! / 15,
          color: AppConstants.AppPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFont(
                  text: "Create",
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
      ),
    );
  }
}
