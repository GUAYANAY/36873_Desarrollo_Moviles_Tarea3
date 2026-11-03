import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/lugares_viewmodel.dart';
import '../widgets/lugar_card.dart';

class LugaresView extends StatelessWidget {
  const LugaresView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LugaresViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lugares turísticos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: vm.lugares.length,
        itemBuilder: (context, index) {
          final lugar = vm.lugares[index];
          return LugarCard(
            lugar: lugar,
            esFavorito: vm.esFavorito(lugar),
            onTap: () =>
                Navigator.pushNamed(context, '/detalle', arguments: lugar),
            onDoubleTap: () =>
                context.read<LugaresViewModel>().toggleFavorito(lugar),
          );
        },
      ),
    );
  }
}
