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
            DataCell(
                Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppFont(
                text: product.Title,
                fontSize: 15,
              ),
            )),
            DataCell(AppFont(
              text: product.Description,
              fontSize: 15,
            )),
            DataCell(AppFont(
              text: product.ISBN,
              fontSize: 15,
            )),
            DataCell(AppFont(
              text: product.Author,
              fontSize: 15,
            )),
            DataCell(
              AppFont(
                text: product.ListPrice.toString(),
                fontSize: 15,
              ),
            ),
            _editButton(),
            _deleteButton(),
          ],
        ),
      );
    }
    return allProducts;
  }

  DataCell _deleteButton() {
    return DataCell(
      Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: AppFont(
                text: "Delete",
                fontSize: 15,
                fontColor: Colors.white,
              ),
            ),
            const Icon(
              Icons.delete,
            ),
          ],
        ),
      ),
    );
  }

  DataCell _editButton() {
    return DataCell(
      Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
              child: AppFont(
                text: "Edit",
                fontSize: 15,
                fontColor: Colors.white,
              ),
            ),
            const Icon(
              Icons.edit,
            ),
          ],
        ),
      ),
    );
  }






  

}
