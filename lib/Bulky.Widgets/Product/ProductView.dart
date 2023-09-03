import 'package:bulky_front_end/Bulky.Widgets/AppFonts.dart';
import 'package:bulky_front_end/Bulky.Utilities/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext ctx) => Container(
        width: 250,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1.5),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.asset(
                "images/imageReplacer.jpg",
                height: 200,
                width: 200,
              ),
            ),
            AppFont(),
            AppFont(),
            AppFont(),
            AppFont(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 230,
                color: AppConstants.AppPrimaryColor,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: AppFont(
                      text: "Details",
                      fontColor: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
