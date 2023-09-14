import 'package:bulky_front_end/Controllers/CategoryController.dart';
import 'package:bulky_front_end/Controllers/ProductController.dart';
import 'package:get/get.dart';

import '../Controllers/HomeController.dart';

Future<void> putControllers() async {
  Get.put(CategoryController());
  Get.put(ProductController());
  Get.put(HomeController());
}
