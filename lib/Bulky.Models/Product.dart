// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';
import 'package:bulky_front_end/Bulky.Models/Category.dart';

class Product {
  int Id = -1;
  String Title = "";
  String Description = "";
  String ISBN = "";
  String Author = "";
  double ListPrice = 0.0;
  double Price = 0.0;
  double Price50 = 0.0;
  double Price100 = 0.0;

  int CategoryId = -1;
  Category? category;
  Product({
    required this.Id,
    required this.Title,
    required this.Description,
    required this.ISBN,
    required this.Author,
    required this.ListPrice,
    required this.Price,
    required this.Price50,
    required this.Price100,
    required this.CategoryId,
    this.category,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': Id,
      'Title': Title,
      'Description': Description,
      'ISBN': ISBN,
      'Author': Author,
      'ListPrice': ListPrice,
      'Price': Price,
      'Price50': Price50,
      'Price100': Price100,
      'CategoryId': CategoryId,
      'category': category?.toMap(),
    };
  }

  factory Product.fromObject(Map<String, dynamic> map) {
    return Product(
      Id: map['Id'] as int,
      Title: map['Title'] as String,
      Description: map['Description'] as String,
      ISBN: map['ISBN'] as String,
      Author: map['Author'] as String,
      ListPrice: map['ListPrice'] as double,
      Price: map['Price'] as double,
      Price50: map['Price50'] as double,
      Price100: map['Price100'] as double,
      CategoryId: map['CategoryId'] as int,
      category: map['category'] != null
          ? Category.fromObject(map['category'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromObject(json.decode(source) as Map<String, dynamic>);
}
