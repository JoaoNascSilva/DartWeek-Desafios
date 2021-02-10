import 'dart:convert';

import 'package:desafio_1/application/entities/menupizzas.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'menu_controller.g.dart';

class MenuController {
  List<MenuPizzas> menu = [
    MenuPizzas(1, 'Calabresa C/ Catupiry', 49.99),
    MenuPizzas(2, 'Lombo C/ Catupiry', 42.99),
    MenuPizzas(3, 'Quatro Queijos', 45.00),
    MenuPizzas(4, 'Especial Calabresa C/ Bacon', 59.99)
  ];

  @Route.get('/')
  Future<Response> getPizzas(Request request) async {
    return Response.ok(jsonEncode(menu?.map((m) => m.toMap())?.toList() ?? []));
  }

  Router get router => _$MenuControllerRouter(this);
}
