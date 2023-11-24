import 'package:get/get.dart';

class CounterController extends GetxController {
  Rx<int> count = 0.obs;

  void increment() {
    count.value++;
    update();
  }

  void decrement() {
    count.value--;
    update();
  }
}
