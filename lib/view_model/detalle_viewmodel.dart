import 'package:flutter/foundation.dart';

import '../model/lugar.dart';

class DetalleViewModel extends ChangeNotifier {
  final Lugar lugar;
  int _imagenActual = 0;

  DetalleViewModel(this.lugar);

  int get imagenActual => _imagenActual;

  void cambiarImagen(int indice) {
    if (indice < 0 || indice >= lugar.imagenes.length) {
      return;
    }

    if (_imagenActual == indice) {
      return;
    }

    _imagenActual = indice;
    notifyListeners();
  }
}
