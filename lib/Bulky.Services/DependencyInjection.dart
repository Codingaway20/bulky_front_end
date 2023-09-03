import 'package:bulky_front_end/Bulky.Controllers/CategoryController.dart';
import 'package:get/get.dart';

import '../Bulky.Controllers/HomeController.dart';

Future<void> putControllers() async {
  Get.put(CategoryController());
  Get.put(HomeController());
  ;
}
