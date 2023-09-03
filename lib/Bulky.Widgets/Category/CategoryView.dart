import 'package:bulky_front_end/Bulky.Controllers/CategoryController.dart';
import 'package:bulky_front_end/Bulky.Widgets/AppFonts.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Container CategoryView(String name, String displayOrder, int id) {
  final CategoryController _categoryController = Get.find();

  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: AppConstants.screenWidth! / 15,
        ),
        AppFont(
          text: name,
          fontColor: Colors.black,
          fontSize: 20,
        ),
        SizedBox(
          width: AppConstants.screenWidth! / 7,
        ),
        AppFont(
          text: displayOrder,
          fontColor: Colors.black,
          fontSize: 20,
        ),
        SizedBox(
          width: AppConstants.screenWidth! / 7,
        ),
        InkWell(
            child: Container(
          color: AppConstants.AppPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 10),
            child: AppFont(
              text: "Edit",
            ),
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        InkWell(
            onTap: () {
              //show are sure you want to delete
              Get.defaultDialog(
                title: "Confirmation message",
                contentPadding: const EdgeInsets.all(100),
                content: AppFont(
                  text: "Are you sure you want to delete",
                  fontSize: 20,
                ),
                onConfirm: () async {
                  //call delete from controller
                  bool deleteCstegoryResult =
                      await _categoryController.deleteCategory(id);
                  if (deleteCstegoryResult) {
                    Get.back();
                    Get.showSnackbar(const GetSnackBar(
                      message: "Category has been deleted successfully",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ));
                  } else {
                    Get.back();
                    Get.showSnackbar(const GetSnackBar(
                      message: "Error occured",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 2),
                    ));
                  }
                },
                textConfirm: "Yes",
                textCancel: "No",
                confirmTextColor: Colors.green,
                cancelTextColor: Colors.red,
              );
            },
            child: Container(
              color: Colors.red,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 19.0, vertical: 10),
                child: AppFont(
                  text: "Delete",
                ),
              ),
            )),
      ],
    ),
  );
}
