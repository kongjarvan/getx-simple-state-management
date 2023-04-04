import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxstate/color_controller.dart';

void main() async {
  Get.put<ColorController>(ColorController());
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> colorList = [
      Colors.blueAccent,
      Colors.redAccent,
      Colors.orangeAccent
    ];

    return GetBuilder<ColorController>(builder: (controller) {
      return Scaffold(
        backgroundColor: colorList[controller.selectedIndex],
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildIncreaseCountButton(controller),
              SizedBox(height: 10),
              buildColorChangeButton(controller, 0, 'blue'),
              SizedBox(height: 10),
              buildColorChangeButton(controller, 1, 'red'),
              SizedBox(height: 10),
              buildColorChangeButton(controller, 2, 'orange'),
            ],
          ),
        ),
      );
    });
  }

  Center buildIncreaseCountButton(ColorController controller) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        width: 150,
        height: 40,
        child: Center(
          child: Text(
            'Tap count : ${controller.count}',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Center buildColorChangeButton(
      ColorController controller, int index, String colorName) {
    return Center(
      child: InkWell(
        onTap: () {
          controller.changeColor(index);
        },
        child: Container(
          width: 150,
          height: 60,
          color: Colors.white,
          child: Center(
            child: Text(
              'Tap to change background color to $colorName',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
