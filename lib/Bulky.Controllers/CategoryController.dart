import 'dart:convert';

import 'package:bulky_front_end/Bulky,Widgets/CategoryView.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Bulky.Services/CategoryServices.dart';

class CategoryController extends GetxController {
  List<Category> caregoriesFromDb = [];

  void getAllCategories() async {
    var response = await CategoryServices.fetchCategory();
    Iterable list = json.decode(response.body);
    List<Category> categoryList = [];
    categoryList = list.map((model) => Category.fromObject(model)).toList();
    //Now update the list that the user see
    caregoriesFromDb = categoryList;
  }

  List<Container> getAllCategoriesViews() {
    getAllCategories();

    List<Container> Categories = [];
    for (var element in caregoriesFromDb) {
      Categories.add(
          CategoryView(element.Name, element.DisplayOrder.toString()));
    }
    return Categories;
  }
}
