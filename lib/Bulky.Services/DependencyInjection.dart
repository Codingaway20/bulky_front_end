import 'package:bulky_front_end/Bulky.Controllers/CategoryController.dart';
import 'package:bulky_front_end/Bulky.Controllers/ProductController.dart';
import 'package:get/get.dart';

import '../Bulky.Controllers/HomeController.dart';

Future<void> putControllers() async {
  Get.put(CategoryController());
  Get.put(ProductController());
  Get.put(HomeController());
}
