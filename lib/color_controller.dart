import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ColorController extends GetxController {
  int selectedIndex = 0;

  int count = 0;

  void changeColor(int index) {
    selectedIndex = index;
    update();
    Get.log('index : $selectedIndex');
  }

  void increase() {
    count++;
    update();
  }
}
