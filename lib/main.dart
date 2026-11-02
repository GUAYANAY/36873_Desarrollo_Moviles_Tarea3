import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/lugares_viewmodel.dart';
import 'view/pantallas/splash_view.dart';
import 'view/pantallas/lugares_view.dart';
import 'view/pantallas/detalle_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LugaresViewModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Turismo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashView(),
        '/lugares': (context) => const LugaresView(),
        '/detalle': (context) => const DetalleView(),
      },
    );
  }
}