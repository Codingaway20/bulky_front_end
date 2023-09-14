import 'package:bulky_front_end/Controllers/CategoryController.dart';
import 'package:bulky_front_end/Controllers/ProductController.dart';
import 'package:bulky_front_end/Models/Product.dart';
import 'package:bulky_front_end/Utilities/AppConstants.dart';
import 'package:bulky_front_end/Views/Product/ProductIndex.dart';
import 'package:bulky_front_end/Widgets/AppFonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCreate extends StatefulWidget {
  const ProductCreate({super.key});

  @override
  State<ProductCreate> createState() => _ProductCreateState();
}

class _ProductCreateState extends State<ProductCreate> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _isbn = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _listPrice = TextEditingController();
  final TextEditingController _price50 = TextEditingController();
  final TextEditingController _price100 = TextEditingController();

  final CategoryController _categoryController = Get.find();
  final ProductController _productController = Get.find();

  List<String> items = [];
  late String initalValue;
  Map<String, int> categoriesMap = {};

  Future<void> getAllCategories() async {
    await _categoryController.getAllCategories();
    var categories = _categoryController.caregoriesFromDb;
    for (var category in categories) {
      categoriesMap[category.Name] = category.Id;
    }

    setState(() {
      initalValue = categoriesMap.keys.first;
    });
  }

  @override
  void initState() {
    getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              _textField(
                fieldName: "Ttile",
                icon: Icons.title,
                controller: _title,
              ),
              _textField(
                fieldName: "Description",
                icon: Icons.description,
                controller: _description,
              ),
              _textField(
                fieldName: "ISBN",
                icon: Icons.numbers_rounded,
                controller: _isbn,
              ),
              _textField(
                fieldName: "Author",
                icon: Icons.book,
                controller: _author,
              ),
              _textField(
                  fieldName: "Price",
                  icon: Icons.price_check,
                  controller: _price),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 400,
                      child: _textField(
                          fieldName: "List price",
                          icon: Icons.list,
                          controller: _listPrice),
                    ),
                    Container(
                      width: 400,
                      child: _textField(
                          fieldName: "price 50",
                          icon: Icons.price_change,
                          controller: _price50),
                    ),
                    Container(
                      width: 400,
                      child: _textField(
                          fieldName: "Price 100",
                          icon: Icons.percent,
                          controller: _price100),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AppFont(
                      text: "--Select category--",
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton(
                    iconEnabledColor: Colors.green,
                    iconDisabledColor: Colors.red,
                    dropdownColor: Colors.grey,
                    // Initial Value
                    value: initalValue,
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: categoriesMap.keys.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        initalValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              createProductButton(),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _textField(
      {required String fieldName,
      required IconData icon,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: fieldName == "Description"
                ? const EdgeInsets.symmetric(vertical: 60)
                : null,
            prefixIcon: Icon(icon),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            label: AppFont(
              text: fieldName,
              fontSize: 20,
            )),
      ),
    );
  }

  InkWell createProductButton() {
    return InkWell(
      onTap: () async {
        //check if any field is empty
        if (_title.text.isEmpty ||
            _description.text.isEmpty ||
            _isbn.text.isEmpty ||
            _author.text.isEmpty ||
            _price.text.isEmpty ||
            _listPrice.text.isEmpty ||
            _price50.text.isEmpty ||
            _price100.text.isEmpty) {
          Get.showSnackbar(const GetSnackBar(
            title: "input error",
            message: "Fill all the fields",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
          ));
          return;
        }
        //chekc if number fileds are not valid
        if (!_price.text.isNum ||
            !_listPrice.text.isNum ||
            !_price50.text.isNum ||
            !_price100.text.isNum) {
          Get.showSnackbar(const GetSnackBar(
            title: "input error",
            message: "Enter number in price fileds",
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 1),
          ));
          return;
        }
        //create new product
        Product newProduct = Product(
            Id: 0,
            Title: _title.text,
            Description: _description.text,
            ISBN: _isbn.text,
            Author: _author.text,
            ListPrice: double.parse(_listPrice.text),
            Price: double.parse(_price.text),
            Price50: double.parse(_price50.text),
            Price100: double.parse(_price100.text),
            CategoryId: categoriesMap[initalValue]!);
        //call controller to add product
        var addProductResult =
            await _productController.addNewProduct(newProduct);
        //show successfull message
        if (addProductResult) {
          Get.showSnackbar(const GetSnackBar(
            snackPosition: SnackPosition.TOP,
            title: "",
            message: "Product has been added successfully",
            backgroundColor: Colors.green,
            duration: Duration(seconds: 1),
          ));
        } else {
          Get.showSnackbar(const GetSnackBar(
            title: "Error",
            message: "Product caould not be added",
            backgroundColor: Colors.red,
            duration: Duration(seconds: 1),
          ));
        }

        //load all products again
        await _productController.getAllProducts();
        //go to products index page
        Get.off(
          () => ProductIndex(),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
            color: AppConstants.AppPrimaryColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppFont(
                text: "Create",
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
