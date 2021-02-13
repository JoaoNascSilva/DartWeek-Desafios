import 'package:delivery_api/modules/menu/menu_routers.dart';
import 'package:shelf_router/src/router.dart';

import 'IRouterConfigure.dart';

class RouterConfigure {
  final Router _router;
  final List<IRouterConfigure> routers = [
    MenuRouters(),
  ];

  RouterConfigure(this._router);

  void configure() => routers.forEach((r) => r.configure(_router));
}
