import 'package:delivery_app/app/modules/menu/menu_controller.dart';
import 'package:delivery_app/app/modules/menu/widgets/menu_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuPage extends GetView<MenuController> {
  final String pizzaSize;

  MenuPage(this.pizzaSize);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.pizzaSize,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          color: Colors.black,
          onPressed: () => Get.back(),
        ),
      ),
      body: SizedBox(
        child: Column(
          children: [
            Expanded(
              child: MenuContent(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
