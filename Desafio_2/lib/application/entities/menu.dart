import 'dart:convert';

class Menu {
  int id;
  String name;
  double preco;

  Menu({
    this.id,
    this.name,
    this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'preco': preco,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Menu(
      id: map['id'],
      name: map['name'],
      preco: map['preco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));
}
