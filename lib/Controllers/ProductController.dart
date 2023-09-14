import 'dart:convert';

import 'package:bulky_front_end/Models/Product.dart';
import 'package:bulky_front_end/Services/ProductServices.dart';
import 'package:bulky_front_end/Widgets/AppFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController {
  //for the object
  List<Product> productsFromDb = [];

  var currentEditedProduct = Product(
      Id: -1,
      Title: "",
      Description: "",
      ISBN: "",
      Author: "",
      ListPrice: 0,
      Price: 0,
      Price50: 0,
      Price100: 0,
      CategoryId: -1);

  Future<bool> deleteProduct(int id) async {
    bool deleteProductResult = await ProductServices.deleteProduct(id);
    return deleteProductResult;
  }

  //this method will call add category service to add new category
  Future<bool> addNewProduct(Product? newProduct) async {
    if (newProduct == null) {
      return false;
    }
    //call add category service
    bool addProductResult = await ProductServices.addProduct(newProduct);
    return addProductResult;
  }

  //this method populate the categoriesfromDB list
  Future<void> getAllProducts() async {
    try {
      var response = await ProductServices.fetchProduct();

      Iterable list = json.decode(response.body);

      for (var element in list) {
        print("elemnt => ${element}");
      }

      List<Product> productList = [];
      productList = list.map((model) => Product.fromObject(model)).toList();

  

      //Now update the list that the user see
      productsFromDb = productList;
      print(productsFromDb.length);
    } catch (e) {
      print("\n\n\nerror \n${e.toString()} ");
    }
  }

  List<DataRow> getAllProductsInfo() {
    List<DataRow> allProducts = [];
    for (Product product in productsFromDb) {
      allProducts.add(
        DataRow(
          cells: <DataCell>[
            DataCell(AppFont(
              text: product.Title,
            )),
            DataCell(AppFont(
              text: product.Description,
            )),
            DataCell(AppFont(
              text: product.ISBN,
            )),
            DataCell(AppFont(
              text: product.Author,
            )),
            DataCell(AppFont(
              text: product.ListPrice.toString(),
            )),
          ],
        ),
      );
    }
    return allProducts;
  }
}
