// Client Types model implementing ChangeNotifier

import 'package:flutter/material.dart';

import 'client_type.dart';

class ClientTypes extends ChangeNotifier {
  final List<ClientType> _types;

  ClientTypes({
    required List<ClientType> types,
  }) : _types = types;

  List<ClientType> get types => _types;

  void add(ClientType type) {
    _types.add(type);
    notifyListeners();
  }

  void remove(ClientType type) {
    _types.remove(type);
    notifyListeners();
  }
}
