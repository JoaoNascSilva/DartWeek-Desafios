import 'package:delivery_app/app/models/menu_item.dart';
import 'package:delivery_app/app/models/menu_model.dart';
import 'package:delivery_app/app/modules/shoppingCard/shopping_card_controller.dart';
import 'package:delivery_app/app/repositpories/menu_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MenuController extends GetxController {
  final MenuRepository _repository;
  final _menu = <MenuModel>[].obs;

  final _flavorsSelected = <MenuItemModel>[].obs;

  List<MenuModel> get menu => _menu;
  List<MenuItemModel> get flavorsSelected => _flavorsSelected;
  double get totalValue =>
      _flavorsSelected.fold(0, (value, item) => value += item.price);

  MenuController(this._repository);

  @override
  void onInit() async {
    super.onInit();
    final menuData = await _repository.findAll();
    _menu.assignAll(menuData);
  }

  void addItem(MenuItemModel item) {
    if (_flavorsSelected.contains(item)) {
      _flavorsSelected.remove(item);
    } else {
      _flavorsSelected.add(item);
    }
  }

  void goToShoppingCart() async {
    Get.put(ShoppingCardController());
    await showBarModalBottomSheet(
      context: Get.context,
      isDismissible: false,
      builder: (_) {
        return Container(
          height: 300,
          child: Text('Sacola'),
        );
      },
    );
    Get.delete<ShoppingCardController>();
  }
}
