// lib/pantallas/metas_objetivos.dart
import 'package:flutter/material.dart';

class MetasObjetivos extends StatelessWidget {
  const MetasObjetivos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metas y Objetivos'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Text(
          'Aquí se establecerán las metas y objetivos de bienestar.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}