import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msa/providers/theme_provider.dart';
import 'package:msa/providers/water_provider.dart';
import 'package:msa/widgets/water_counter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MSA - Mi Salud Activa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Registro de Agua',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            WaterCounter(),
          ],
        ),
      ),
    );
  }
}