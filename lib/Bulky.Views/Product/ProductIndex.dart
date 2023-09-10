import 'package:bulky_front_end/Bulky.Controllers/ProductController.dart';
import 'package:bulky_front_end/Bulky.Models/Product.dart';
import 'package:bulky_front_end/Bulky.Widgets/NavigationBar.dart';
import 'package:bulky_front_end/Bulky.Widgets/Product/ProductTable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductIndex extends StatefulWidget {
  const ProductIndex({super.key});

  @override
  State<ProductIndex> createState() => _ProductIndexState();
}

class _ProductIndexState extends State<ProductIndex> {
  final ProductController _productControoler = Get.find();
  @override
  void initState() {
    _productControoler.getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            NavBar(),
            ProductTable(allProducts: _productControoler.getAllProductsInfo()),
          ]),
        ),
      ),
    );
  }
}
