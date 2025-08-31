// lib/pantallas/ingesta_agua.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msa/providers/water_provider.dart';
import 'package:msa/widgets/water_counter.dart';

class IngestaAgua extends StatelessWidget {
  const IngestaAgua({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingesta de Agua'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Vasos de agua consumidos:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              WaterCounter(),
            ],
          ),
        ),
      ),
    );
  }
}