import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tarea2_app_moviles/model/lugar.dart';
import 'package:tarea2_app_moviles/view/pantallas/detalle_view.dart';

void main() {
  testWidgets('muestra el detalle y permite deslizar sus imágenes', (
    tester,
  ) async {
    final lugar = lugaresEjemplo.first;

    await tester.pumpWidget(
      MaterialApp(
        onGenerateRoute: (settings) => MaterialPageRoute(
          settings: RouteSettings(arguments: lugar),
          builder: (_) => const DetalleView(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(lugar.nombre), findsOneWidget);
    expect(find.text(lugar.descripcion), findsOneWidget);
    expect(find.text(lugar.ubicacion), findsOneWidget);
    expect(find.byKey(const ValueKey('detalle-galeria')), findsOneWidget);
    expect(find.bySemanticsLabel('Imagen 1 de 3'), findsOneWidget);

    await tester.dragFrom(const Offset(600, 150), const Offset(-600, 0));
    await tester.pumpAndSettle();

    expect(find.byKey(const ValueKey('detalle-galeria')), findsOneWidget);
    expect(find.bySemanticsLabel('Imagen 2 de 3'), findsOneWidget);
  });
}
