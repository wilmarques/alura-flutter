// Model that represents all clients within the system
// It uses ChangeNotifier to notify the listeners when the list is updated

import 'package:flutter/material.dart';

import 'client.dart';

class Clients extends ChangeNotifier {
  final List<Client> _clients;

  Clients({
    required List<Client> clients,
  }) : _clients = clients;

  List<Client> get clients => _clients;

  void add(Client client) {
    _clients.add(client);
    notifyListeners();
  }

  void remove(Client client) {
    _clients.remove(client);
    notifyListeners();
  }
}
