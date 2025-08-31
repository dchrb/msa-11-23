// lib/pantallas/registro_comidas.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../providers/food_provider.dart';
import '../models/meal.dart';

class RegistroComidas extends StatefulWidget {
  const RegistroComidas({super.key});

  @override
  State<RegistroComidas> createState() => _RegistroComidasState();
}

class _RegistroComidasState extends State<RegistroComidas> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _caloriesController = TextEditingController();
  final _hourController = TextEditingController();

  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _hourController.text = DateFormat('HH:mm').format(DateTime.now());
  }

  @override
  void dispose() {
    _nameController.dispose();
    _caloriesController.dispose();
    _hourController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        final now = DateTime.now();
        final selectedDateTime = DateTime(
          now.year,
          now.month,
          now.day,
          _selectedTime.hour,
          _selectedTime.minute,
        );
        _hourController.text = DateFormat('HH:mm').format(selectedDateTime);
      });
    }
  }

  void _submitMeal() {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final calories = double.tryParse(_caloriesController.text) ?? 0.0;
      final now = DateTime.now();
      final timestamp = DateTime(
        now.year,
        now.month,
        now.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      Provider.of<FoodProvider>(context, listen: false).addMeal(name, calories, timestamp);

      _nameController.clear();
      _caloriesController.clear();
      _hourController.clear();
      FocusScope.of(context).unfocus();
    }
  }

  void _showEditMealDialog(BuildContext context, Meal meal) {
    _nameController.text = meal.name;
    _caloriesController.text = meal.calories.toString();
    _hourController.text = DateFormat('HH:mm').format(meal.timestamp);
    _selectedTime = TimeOfDay.fromDateTime(meal.timestamp);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Comida'),
          content: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre de la comida'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingrese un nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _caloriesController,
                  decoration: const InputDecoration(labelText: 'Calorías'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || double.tryParse(value) == null) {
                      return 'Por favor, ingrese un número válido';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _hourController,
                  readOnly: true,
                  onTap: () => _selectTime(context),
                  decoration: const InputDecoration(labelText: 'Hora'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _nameController.clear();
                _caloriesController.clear();
                _hourController.clear();
              },
              child: const Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isNotEmpty && _caloriesController.text.isNotEmpty) {
                  final newTimestamp = DateTime(
                    meal.timestamp.year,
                    meal.timestamp.month,
                    meal.timestamp.day,
                    _selectedTime.hour,
                    _selectedTime.minute,
                  );
                  Provider.of<FoodProvider>(context, listen: false).updateMeal(
                    meal.id,
                    _nameController.text,
                    double.tryParse(_caloriesController.text) ?? 0.0,
                    newTimestamp,
                  );
                  Navigator.of(context).pop();
                  _nameController.clear();
                  _caloriesController.clear();
                  _hourController.clear();
                }
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final foodProvider = Provider.of<FoodProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Comidas'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Resumen de Calorías',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Hoy: ${foodProvider.getDailyCalories(DateTime.now()).toStringAsFixed(0)} kcal',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    const Text('Resumen semanal:', style: TextStyle(fontSize: 16)),
                    ...foodProvider.getWeeklySummary().entries.map(
                          (entry) => Text(
                            '${entry.key}: ${entry.value.toStringAsFixed(0)} kcal',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Nombre de la comida'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, ingrese un nombre';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _caloriesController,
                    decoration: const InputDecoration(labelText: 'Calorías'),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || double.tryParse(value) == null) {
                        return 'Por favor, ingrese un número válido';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _hourController,
                    readOnly: true,
                    onTap: () => _selectTime(context),
                    decoration: const InputDecoration(labelText: 'Hora'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submitMeal,
                    child: const Text('Agregar Comida'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (foodProvider.meals.isNotEmpty)
              const Text(
                'Comidas registradas:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: foodProvider.meals.length,
              itemBuilder: (context, index) {
                final meal = foodProvider.meals[index];
                return ListTile(
                  title: Text('${meal.name} - ${meal.calories.toStringAsFixed(0)} kcal'),
                  subtitle: Text(DateFormat('HH:mm').format(meal.timestamp)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _showEditMealDialog(context, meal),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          Provider.of<FoodProvider>(context, listen: false).deleteMeal(meal.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}