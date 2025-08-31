import 'package:flutter/material.dart';
import 'package:msa/pantallas/registro_comidas.dart';
import 'package:msa/pantallas/temas_configuracion.dart';
import 'package:msa/pantallas/pantalla_acerca_de.dart';
import 'package:msa/pantallas/ingesta_agua.dart';
import 'package:msa/pantallas/metas_objetivos.dart';
import 'package:msa/pantallas/peso_altura_medidas.dart';
import 'package:msa/pantallas/recompensas.dart';
import 'package:msa/pantallas/recordatorios.dart';
import 'package:msa/pantallas/pantalla_inicio.dart';

class PantallaPrincipal extends StatefulWidget {
  const PantallaPrincipal({super.key});

  @override
  State<PantallaPrincipal> createState() => _PantallaPrincipalState();
}

class _PantallaPrincipalState extends State<PantallaPrincipal> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    PantallaInicio(),
    Text('Pantalla de Entrenamientos'), 
    Text('Pantalla de Progreso'), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Salud Activa'),
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) => _onMenuItemSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.color_lens, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    const Text('Temas y colores'),
                  ],
                ),
              ),
              PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Theme.of(context).primaryColor),
                    const SizedBox(width: 8),
                    const Text('Acerca de'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.account_circle,
                    size: 60,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Opciones Adicionales',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.fastfood,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Registro de Comidas',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegistroComidas()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.local_drink, 
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Ingesta de Agua', 
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const IngestaAgua()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.track_changes, 
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Metas y Objetivos',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MetasObjetivos()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.scale, 
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Peso, Altura y Medidas',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PesoAlturaMedidas()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.card_giftcard, 
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Recompensas',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Recompensas()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.notifications, 
                color: Theme.of(context).colorScheme.onSurface,
              ),
              title: Text(
                'Recordatorios',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Recordatorios()));
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Entrenamientos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart),
            label: 'Progreso',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onMenuItemSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TemasConfiguracion(),
          ),
        );
        break;
      case 1:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const PantallaAcercaDe(),
          ),
        );
        break;
    }
  }
}