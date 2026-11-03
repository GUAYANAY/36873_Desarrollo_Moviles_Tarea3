import 'package:flutter/foundation.dart';

import '../model/lugar.dart';

class LugaresViewModel extends ChangeNotifier {
  final List<Lugar> lugares = lugaresEjemplo;
  final List<Lugar> _favoritos = [];

  List<Lugar> get favoritos => List.unmodifiable(_favoritos);

  bool esFavorito(Lugar lugar) => _favoritos.contains(lugar);

  void toggleFavorito(Lugar lugar) {
    if (_favoritos.contains(lugar)) {
      _favoritos.remove(lugar);
    } else {
      _favoritos.add(lugar);
    }
    notifyListeners();
  }

  // Falta (parte de tus compañeras): lugar seleccionado, imagen actual
}
