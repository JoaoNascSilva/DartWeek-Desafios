import 'package:delivery_app/app/modules/shoppingCard/widgets/shopping_card_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shopping_card_controller.dart';

class ShoppingCardPage extends GetView<ShoppingCardController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 2, right: 8),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  color: Get.theme.primaryColor,
                  size: 20,
                ),
              ),
              Text(
                'Carrinho de Compra',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Get.back(),
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (_, constructor) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constructor.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      ShoppingCardItems(),
                      Divider(thickness: 2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
