import 'dart:convert';

import 'package:bulky_front_end/Bulky,Widgets/AppFonts.dart';
import 'package:bulky_front_end/Bulky.Controllers/HomeController.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Services/CategoryServices.dart';
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

  //where all the students will be filled
  List<Category> categories = [];

  //Method to get the students list from ther API
  Future getCategory() async {
    var response = await CategoryServices.fetchCategory();
    Iterable list = json.decode(response.body);
    List<Category> categoryList = [];
    categoryList = list.map((model) => Category.fromObject(model)).toList();
    //Now update the list that the user see
    setState(() {
      categories = categoryList;
    });
  }

  @override
  void initState() {
    getCategory();
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
                    fontSize: AppConstants.screenWidth! / 25,
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
              Card(
                color: Colors.white12,
                elevation: 2,
                child: ListTile(
                  title: ListTile(
                    title: Text(
                      'Id: ${categories[0].Id}',
                    ),
                    leading: Text("Name : ${categories[0].Name}"),
                    subtitle: Text(
                      'Displaye orderr: ${categories[0].DisplayOrder}',
                    ),
                    onTap: null,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InkWell createCategoryButton() {
    return InkWell(
      onTap: () {},
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
