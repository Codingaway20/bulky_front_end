import 'package:bulky_front_end/Controllers/ProductController.dart';
import 'package:bulky_front_end/Models/Product.dart';
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
            ProductTable(allProducts: allproducts),
          ]),
        ),
      ),
    );
  }
}
