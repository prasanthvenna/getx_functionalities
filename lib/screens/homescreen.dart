import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_utilities_tutorial/controllers/fav_controller.dart';
import 'package:getx_utilities_tutorial/controllers/theme_controller.dart';
import 'package:getx_utilities_tutorial/utils/theme_colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final UpdateThemeController themeController =
      Get.put(UpdateThemeController());

  final FavouriteItems favitems = Get.put(FavouriteItems());

  @override
  Widget build(BuildContext context) {
    print('rebuild123');
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).brightness == Brightness.light
      //       ? LightThemeColors.secondaryBackgroundColor
      //       : DarkThemeColors.secondaryBackgroundColor,
      //   title: Text(
      //     'GetX Utils',
      //     style: Theme.of(context).brightness == Brightness.light
      //         ? TextStyle(color: LightThemeColors.primaryColor)
      //         : TextStyle(color: DarkThemeColors.primaryColor),
      //   ),
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         Get.snackbar(
      //           'Alert',
      //           'Snackbar displayed',
      //           snackPosition: SnackPosition.TOP,
      //           animationDuration: const Duration(seconds: 1),
      //           backgroundColor: Colors.blueGrey,
      //           backgroundGradient: const LinearGradient(
      //             colors: [Colors.blue, Colors.blueGrey],
      //           ),
      //           titleText: const Text(
      //               'Snackbar Displayed'), // it overwrites the given content text in snackbar

      //           borderColor: Colors.black54,
      //           borderRadius:
      //               20.0, //inter-related to each other : mention width orelse it throws null
      //           borderWidth: 1.0,

      //           barBlur: 100,
      //           colorText: Colors.white, //changes the color of the message Text
      //           dismissDirection: DismissDirection.startToEnd,
      //           isDismissible: false,
      //           snackStyle: SnackStyle.FLOATING,
      //           duration: const Duration(seconds: 2),
      //           icon: const Icon(Icons.account_box),
      //           showProgressIndicator: false,
      //         );
      //       },
      //       icon: Icon(
      //         Icons.add_task,
      //         color: Theme.of(context).brightness == Brightness.light
      //             ? LightThemeColors.primaryColor
      //             : DarkThemeColors.primaryColor,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {
      //         Get.defaultDialog(
      //             backgroundColor: Colors.white,
      //             barrierDismissible: true,
      //             buttonColor: Colors.white,
      //             cancelTextColor: Colors.black,
      //             confirmTextColor: Colors.black,
      //             content: const Column(
      //               children: [
      //                 Text('Alert Dialog Displayed'),
      //                 Icon(Icons.image),
      //               ],
      //             ),
      //             radius: 20,
      //             textConfirm: 'confirm',
      //             textCancel: 'cancel',
      //             cancel: TextButton(
      //               onPressed: () {
      //                 Get.back();
      //               },
      //               child: const Text('cancel'),
      //             ),
      //             confirm: TextButton(
      //               onPressed: () {
      //                 Get.back();
      //               },
      //               child: const Text('confirm'),
      //             ),

      //             //Here we have a MiddleText for the content in dialog, if you want multiple children like icons or images or anything, we have option called content
      //             middleText: 'Hello!');
      //       },
      //       icon: Icon(
      //         Icons.add_alert,
      //         color: Theme.of(context).brightness == Brightness.light
      //             ? LightThemeColors.primaryColor
      //             : DarkThemeColors.primaryColor,
      //       ),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(
      //         Icons.menu,
      //         color: Theme.of(context).brightness == Brightness.light
      //             ? LightThemeColors.primaryColor
      //             : DarkThemeColors.primaryColor,
      //       ),
      //     ),
      //   ],
      // ),
      
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: SizedBox(
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.dark_mode),
                onPressed: () {
                  // themeController
                  //     .mychangeTheme();
                  themeController.mychangeTheme(true);
                },
              ),
              IconButton(
                icon: const Icon(Icons.light_mode),
                onPressed: () {
                  // themeController.mychangeTheme();
                  themeController.mychangeTheme(false);
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Center(
          //     child: TextButton(
          //       onPressed: () {
          //         Get.toNamed('/FirstScreen');
          //       },
          //       child: Text(
          //         'message'.tr,
          //         style: Theme.of(context).brightness == Brightness.light
          //             ? TextStyle(color: LightThemeColors.primaryTextColor)
          //             : TextStyle(color: DarkThemeColors.primaryTextColor),
          //       ),
          //     ),
          //   ),
          // ),
          Obx(
            () => Text("${themeController.isDarkMode.value}"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: favitems.sports.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Card(
                    elevation: 1.0,
                    child: ListTile(
                      onTap: () {
                        if (favitems.favList
                            .contains(favitems.sports[index].toString())) {
                          favitems.removeFromFavorite(
                              favitems.sports[index].toString());
                        } else {
                          favitems.addToFavourite(
                              favitems.sports[index].toString());
                        }
                      },
                      title: Text(favitems.sports[index].toString()),
                      trailing: favitems.favList
                              .contains(favitems.sports[index].toString())
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
