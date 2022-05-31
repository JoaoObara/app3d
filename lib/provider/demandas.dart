import 'dart:math';

import 'package:flutter/material.dart';

import '../models/demanda.dart';

class Demandas with ChangeNotifier {
  final Map<String, Demanda> _items = {};

  List<Demanda> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Demanda byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Demanda demanda) {
    if (demanda == null) {
      return;
    }

    // alterar
    if (demanda.id != null &&
        demanda.id!.trim().isNotEmpty &&
        _items.containsKey(demanda.id)) {
      _items.update(
          demanda.id!,
          (_) => Demanda(
                id: demanda.id,
                nome: demanda.nome,
                descricao: demanda.descricao,
                status: demanda.status,
                inicio: demanda.inicio,
                fim: demanda.fim,
              ));
    } else {
      // adicionar
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => Demanda(
                id: id,
                nome: demanda.nome,
                descricao: demanda.descricao,
                status: demanda.status,
                inicio: demanda.inicio,
                fim: demanda.fim,
              ));
    }

    notifyListeners();
  }

  void remove(Demanda demanda) {
    if (demanda != null && demanda.id != null) {
      _items.remove(demanda.id);
      notifyListeners();
    }
  }
}
