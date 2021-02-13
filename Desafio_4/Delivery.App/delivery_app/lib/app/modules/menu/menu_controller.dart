import 'package:delivery_app/app/models/menu_model.dart';
import 'package:delivery_app/app/repositpories/menu_repository.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  final MenuRepository _repository;
  final _menu = <MenuModel>[].obs;

  List<MenuModel> get menu => _menu;

  MenuController(this._repository);

  @override
  void onInit() async {
    super.onInit();
    final menuData = await _repository.findAll();
    _menu.assignAll(menuData);
  }
}
