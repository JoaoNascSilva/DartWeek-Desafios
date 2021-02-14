import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';
import 'widgets/home_header.dart';

class HomePage extends GetView<HomeController> {
  static const String ROUTE_PAGE = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HomeHeader(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  child: Text(
                    'Pizzas',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListTile(
                      title: Text(
                        'Grande ',
                        style: TextStyle(
                            fontSize: 16, color: Get.theme.accentColor),
                      ),
                      onTap: () => controller.openMenu('Grande'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
