import 'package:delivery_app/app/models/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ShoppingCardItem extends StatelessWidget {
  final MenuItemModel item;
  final numerFormat =
      NumberFormat.currency(name: 'R\$', locale: 'pt_BR', decimalDigits: 2);

  ShoppingCardItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          item.name,
          style: TextStyle(fontSize: 14),
        ),
        trailing: Text(
          numerFormat.format(item.price),
          style: TextStyle(fontSize: 14),
        ),
        onTap: () async {
          await Get.defaultDialog(
            title: '',
            backgroundColor: Colors.grey[400],
            content: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(
                      Icons.local_pizza_rounded,
                      color: Colors.orange[800],
                    ),
                  ),
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    numerFormat.format(item.price),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            cancel: RaisedButton(
              child: Text(
                'Voltar',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () => Get.back(),
            ),
          );
        },
      ),
    );
  }
}
