import 'dart:convert';
import 'package:bulky_front_end/Widgets/Category/CategoryView.dart';
import 'package:bulky_front_end/Models/Category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Services/CategoryServices.dart';

class CategoryController extends GetxController {
  //for the object
  List<Category> caregoriesFromDb = [];

  var currentEditedCategory = Category(Id: -1, Name: "", DisplayOrder: -1).obs;

  Future<bool> deleteCategory(int id) async {
    bool deleteCategoryResult = await CategoryServices.deleteCategory(id);
    return deleteCategoryResult;
  }

  //this method will call add category service to add new category
  Future<bool> addNewCategory(Category? newCategory) async {
    if (newCategory == null) {
      return false;
    }
    //call add category service
    bool addCategoryResult = await CategoryServices.addCategory(newCategory);
    return addCategoryResult;
  }

  //this method populate the categoriesfromDB list
  Future<void> getAllCategories() async {
    var response = await CategoryServices.fetchCategory();
    Iterable list = json.decode(response.body);
    List<Category> categoryList = [];
    categoryList = list.map((model) => Category.fromObject(model)).toList();
    //Now update the list that the user see
    caregoriesFromDb = categoryList;
  }



  
  //this method will populate the a list of containers which contains the categories info
  List<Container> getAllCategoriesViews() {
    //for the widget
    List<Container> Categories = [];
    for (var element in caregoriesFromDb) {
      Categories.add(
        CategoryView(
          element.Name,
          element.DisplayOrder.toString(),
          element.Id,
        ),
      );
    }
    return Categories;
  }
}
