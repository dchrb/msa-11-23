// lib/pantallas/recordatorios.dart
import 'package:flutter/material.dart';

class Recordatorios extends StatelessWidget {
  const Recordatorios({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordatorios'),
      ),
      body: const Center(
        child: Text('Aquí se mostrarán los recordatorios.'),
      ),
    );
  }
}