import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ColorController extends GetxController {
  RxInt selectedIndex = 0.obs;

  RxInt count = 0.obs;

  void changeColor(int value) {
    selectedIndex(value);
    count++;
    Get.log('index : $selectedIndex');
  }
}
