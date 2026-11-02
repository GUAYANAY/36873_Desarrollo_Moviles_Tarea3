import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controlador;
  late Animation<double> opacidad;
  late Animation<double> tamano;

  @override
  void initState() {
    super.initState();

    controlador = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    opacidad = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controlador, curve: Curves.easeIn),
    );

    tamano = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: controlador, curve: Curves.easeOutBack),
    );

    // Inicia la animación y, al terminar, espera un momento y pasa a /lugares
    controlador.forward().then((_) async {
      await Future.delayed(const Duration(milliseconds: 800));
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/lugares');
    });
  }

  @override
  void dispose() {
    controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: FadeTransition(
          opacity: opacidad,
          child: ScaleTransition(
            scale: tamano,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.travel_explore, size: 100, color: Colors.white),
                SizedBox(height: 16.0),
                Text(
                  'Ecuador Turístico',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}