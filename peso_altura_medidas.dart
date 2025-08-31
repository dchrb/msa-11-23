// lib/pantallas/peso_altura_medidas.dart
import 'package:flutter/material.dart';

class PesoAlturaMedidas extends StatelessWidget {
  const PesoAlturaMedidas({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peso, Altura y Medidas'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          'Aquí se registrarán el peso, la altura y otras medidas corporales.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}