// lib/pantallas/recompensas.dart
import 'package:flutter/material.dart';

class Recompensas extends StatelessWidget {
  const Recompensas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recompensas'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          'Aquí se mostrarán las recompensas y logros del usuario.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}