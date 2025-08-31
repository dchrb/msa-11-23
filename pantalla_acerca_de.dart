// lib/pantallas/pantalla_acerca_de.dart
import 'package:flutter/material.dart';

class PantallaAcercaDe extends StatelessWidget {
  const PantallaAcercaDe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: const Center(
        child: Text('Esta es la pantalla "Acerca de".'),
      ),
    );
  }
}