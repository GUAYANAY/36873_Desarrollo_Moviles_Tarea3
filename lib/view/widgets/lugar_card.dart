import 'package:flutter/material.dart';

import '../../model/lugar.dart';

class LugarCard extends StatelessWidget {
  final Lugar lugar;
  final bool esFavorito;
  final VoidCallback onTap;
  final VoidCallback onDoubleTap;

  const LugarCard({
    super.key,
    required this.lugar,
    required this.esFavorito,
    required this.onTap,
    required this.onDoubleTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        clipBehavior: Clip.antiAlias,
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              lugar.imagenes.first,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 180,
                child: Center(child: Icon(Icons.image_not_supported, size: 48)),
              ),
            ),
            ListTile(
              title: Text(
                lugar.nombre,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(lugar.ubicacion),
              trailing: Icon(
                esFavorito ? Icons.favorite : Icons.favorite_border,
                color: esFavorito ? Colors.red : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
