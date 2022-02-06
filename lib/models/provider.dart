import 'package:flutter/cupertino.dart';

class DataProvider extends ChangeNotifier {
  String? _name = '';

  String? get getName => _name;

  set setName(String? name) {
    _name = name;
  }
  String? _email = '';

  String? get getEmail => _email;

  set setEmail(String? email) {
    _email = email;
  }
  int? _age = 0;

  int? get getAge => _age;

  set setAge(int? age) {
    _age = age;
  }
}
