import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/lugar.dart';
import '../../view_model/detalle_viewmodel.dart';

class DetalleView extends StatelessWidget {
  const DetalleView({super.key});

  @override
  Widget build(BuildContext context) {
    final argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento is! Lugar) {
      return Scaffold(
        appBar: AppBar(title: const Text('Detalle')),
        body: const Center(
          child: Text('No se encontró la información del lugar.'),
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => DetalleViewModel(argumento),
      child: const _DetalleContenido(),
    );
  }
}

class _DetalleContenido extends StatelessWidget {
  const _DetalleContenido();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetalleViewModel>();
    final lugar = viewModel.lugar;

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FC),
      appBar: AppBar(
        title: Text(lugar.nombre),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: _Galeria(lugar: lugar),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
              child: _InformacionLugar(lugar: lugar),
            ),
          ],
        ),
      ),
    );
  }
}

class _InformacionLugar extends StatelessWidget {
  final Lugar lugar;

  const _InformacionLugar({required this.lugar});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.location_on_rounded,
              color: Colors.deepPurple,
              size: 25,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                lugar.ubicacion,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Sobre este lugar',
          style: TextStyle(
            color: Color(0xFF292535),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          lugar.descripcion,
          style: const TextStyle(
            color: Color(0xFF625D6D),
            fontSize: 16,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 22),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withValues(alpha: 0.08),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.swipe_rounded,
                color: Colors.deepPurple,
                size: 28,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Desliza la imagen para descubrir más vistas',
                  style: TextStyle(
                    color: Colors.deepPurple.shade700,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Galeria extends StatelessWidget {
  final Lugar lugar;

  const _Galeria({required this.lugar});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetalleViewModel>();

    return Stack(
      fit: StackFit.expand,
      children: [
        PageView.builder(
          key: const ValueKey('detalle-galeria'),
          itemCount: lugar.imagenes.length,
          onPageChanged: context.read<DetalleViewModel>().cambiarImagen,
          itemBuilder: (context, index) => Image.asset(
            lugar.imagenes[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              color: Colors.deepPurple.shade100,
              alignment: Alignment.center,
              child: const Icon(
                Icons.image_not_supported_outlined,
                color: Colors.white,
                size: 52,
              ),
            ),
          ),
        ),
        const IgnorePointer(
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0xB3000000)],
                stops: [0.55, 1],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Semantics(
              label:
                  'Imagen ${viewModel.imagenActual + 1} de ${lugar.imagenes.length}',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  lugar.imagenes.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: viewModel.imagenActual == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: viewModel.imagenActual == index
                          ? Colors.white
                          : Colors.white54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}