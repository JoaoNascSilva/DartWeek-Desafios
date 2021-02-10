import 'dart:convert';

class MenuPizzas {
  final int id;
  final String nome;
  final double preco;

  MenuPizzas(this.id, this.nome, this.preco);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'preco': preco,
    };
  }

  factory MenuPizzas.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return MenuPizzas(
      map['id'],
      map['nome'],
      map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuPizzas.fromJson(String source) =>
      MenuPizzas.fromMap(json.decode(source));
}
