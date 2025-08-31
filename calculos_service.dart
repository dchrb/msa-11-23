// lib/services/calculos_service.dart
class CalculosService {
  double calcularIMC(double peso, double altura) {
    if (altura <= 0) return 0.0;
    return peso / (altura * altura);
  }
}