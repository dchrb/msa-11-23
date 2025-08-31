import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:msa/pantalla_principal.dart'; 
import 'package:msa/providers/food_provider.dart';
import 'package:msa/providers/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FoodProvider()),
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Mi Salud Activa',
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme(themeProvider.primaryColor),
      darkTheme: MyThemes.darkTheme(themeProvider.primaryColor),
      home: const PantallaPrincipal(),
      debugShowCheckedModeBanner: false,
    );
  }
}