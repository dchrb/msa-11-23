// lib/widgets/water_counter.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msa/providers/water_provider.dart';

class WaterCounter extends StatelessWidget {
  const WaterCounter({super.key});

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios del WaterProvider
    final waterProvider = Provider.of<WaterProvider>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle, size: 40, color: Colors.red),
          onPressed: () => waterProvider.removeGlass(),
        ),
        Text(
          '${waterProvider.glassesCount}',
          style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.add_circle, size: 40, color: Colors.green),
          onPressed: () => waterProvider.addGlass(),
        ),
      ],
    );
  }
}