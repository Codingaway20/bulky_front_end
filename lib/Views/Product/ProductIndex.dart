import 'package:bulky_front_end/Controllers/ProductController.dart';
import 'package:bulky_front_end/Models/Product.dart';
import 'package:bulky_front_end/Utilities/AppConstants.dart';
import 'package:bulky_front_end/Views/Product/ProductCreate.dart';
import 'package:bulky_front_end/Widgets/AppFonts.dart';
import 'package:bulky_front_end/Widgets/NavigationBar.dart';
import 'package:bulky_front_end/Widgets/Product/ProductTable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductIndex extends StatefulWidget {
  const ProductIndex({super.key});

  @override
  State<ProductIndex> createState() => _ProductIndexState();
}

class _ProductIndexState extends State<ProductIndex> {
  final ProductController _productControoler = Get.find();

  List<DataRow> allproducts = [];

  @override
  void initState() {
    allproducts = _productControoler.getAllProductsInfo();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            NavBar(),
            const SizedBox(height: 80,),
            createProductButton(),
            const SizedBox(height: 20,),
            ProductTable(allProducts: allproducts),
          ]),
        ),
      ),
    );
  }
  InkWell createProductButton() {
    return InkWell(
      onTap: () {
        Get.to(
          ProductCreate(),
          transition: Transition.fade,
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: AppConstants.AppPrimaryColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFont(
                text: "Add new Product",
                fontColor: Colors.white,
                fontSize: 15,
              ),
              const Icon(
                Icons.add,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
