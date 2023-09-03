import 'package:bulky_front_end/Bulky.Widgets/AppFonts.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:flutter/material.dart';

Container CategoryView(String name, String displayOrder) {
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
            child: Container(
          color: Colors.red,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 10),
            child: AppFont(
              text: "Delete",
            ),
          ),
        )),
      ],
    ),
  );
}
