import 'package:delivery_api/application/database/IDatabaseConnection.dart';
import 'package:delivery_api/application/entities/menu.dart';
import 'package:delivery_api/application/exceptions/databaseErrorExceptions.dart';
import 'package:delivery_api/repositories/menu/IMenuRepository.dart';
import 'package:injectable/injectable.dart';
import 'package:mysql1/mysql1.dart';

@LazySingleton(as: IMenuRepository)
class Menurepository implements IMenuRepository {
  final IDatabaseConnection _connection;

  Menurepository(this._connection);

  @override
  Future<List<Menu>> findAll() async {
    final connection = await _connection.openConnection();

    try {
      final result = await connection.query('SELECT * FROM cardapio;');

      if (result.isNotEmpty) {
        final menus = result.map<Menu>((row) {
          return Menu(
            id: row['id'] as int,
            name: row['nome'] as String,
            preco: row['preco'] as double,
          );
        }).toList();
        return menus;
      }
      return [];
    } on MySqlException catch (e) {
      print(e);
      throw DataBaseException();
    } finally {
      await connection?.close();
    }
  }
}
