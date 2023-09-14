// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bulky_front_end/Models/Category.dart';

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
      'id': Id,
      'title': Title,
      'description': Description,
      'isbn': ISBN,
      'author': Author,
      'listPrice': ListPrice,
      'price': Price,
      'price50': Price50,
      'price100': Price100,
      'categoryId': CategoryId,
      'category': category?.toMap(),
    };
  }

  Product.fromObject(dynamic map) {
    this.Id = map['id'] ?? -1;
    this.Title = map['title'] ?? "null";
    this.Description = map['description'] ?? "null";
    this.ISBN = map['isbn'] ?? "null";
    this.Author = map['author'] ?? "null";
    this.ListPrice = map['listPrice'] ?? 0.0;
    this.Price = map['price'] ?? 0.0;
    this.Price50 = map['price50'] ?? 0.0;
    this.Price100 = map['price100'] ?? 0.0;
    this.CategoryId = map['categoryId'] ?? -1;
    this.category = map['category'] != null
        ? Category.fromObject(map['category'] as Map<String, dynamic>)
        : Category(Id: -1, Name: "", DisplayOrder: -1);
  }
}
