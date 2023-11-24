import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_utilities_tutorial/controllers/counter_controller.dart';
import 'package:getx_utilities_tutorial/utils/theme_colors.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final CounterController counterController = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' First Screen',
          style: Theme.of(context).brightness == Brightness.light
              ? TextStyle(
                  color: LightThemeColors.primaryColor,
                )
              : TextStyle(
                  color: DarkThemeColors.primaryColor,
                ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                counterController.decrement();
              },
              icon: const Icon(Icons.remove),
            ),
            Obx(() => Text(
              counterController.count.toString(),
              style: const TextStyle(fontSize: 22),
            ),),
            IconButton(
              onPressed: () {
                counterController.increment();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
