// lib/pantallas/temas_configuracion.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TemasConfiguracion extends StatelessWidget {
  const TemasConfiguracion({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Temas y Colores'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tema oscuro',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: themeProvider.themeMode == ThemeMode.dark,
                  onChanged: (value) {
                    themeProvider.toggleTheme(value);
                  },
                  activeColor: Theme.of(context).primaryColor, // Color cuando está activo
                  inactiveThumbColor: Colors.grey, // Color del círculo cuando está inactivo
                  inactiveTrackColor: Colors.black12, // Color de la pista cuando está inactivo
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Selecciona un color principal:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ColorPicker(
              pickerColor: themeProvider.primaryColor,
              onColorChanged: (color) {
                themeProvider.setPrimaryColor(color);
              },
            ),
          ],
        ),
      ),
    );
  }
}