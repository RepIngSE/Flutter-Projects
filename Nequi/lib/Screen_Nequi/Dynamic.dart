import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Para copiar al portapapeles

class DynamicKeyWidget extends StatefulWidget {
  const DynamicKeyWidget({super.key});

  @override
  _DynamicKeyWidgetState createState() => _DynamicKeyWidgetState();
}

// Función para generar una clave aleatoria de 6 dígitos
  String generateDynamicKey() {
    Random random = Random();
    return (random.nextInt(900000) + 100000).toString(); // Rango entre 100000 y 999999
  }

class _DynamicKeyWidgetState extends State<DynamicKeyWidget> {
  String dynamicKey = generateDynamicKey(); // La clave inicial
  double progress = 0.0; // El progreso del círculo
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // Función para iniciar el temporizador de 10 segundos
  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        progress += 0.01;
        if (progress >= 1.0) {
          // Resetea el progreso y genera una nueva clave
          progress = 0.0;
          dynamicKey = generateDynamicKey();
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancela el temporizador al salir
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: 240,
      padding: const EdgeInsets.all(9), // Ajusta el padding para hacerlo más pequeño
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Colors.transparent,// Fondo transparente
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(31, 255, 255, 255),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Círculo de progreso que representa el tiempo
          SizedBox(
            height: 23, // Reducir tamaño del círculo
            width: 23,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 4, // Reducir grosor del círculo
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 206, 9, 150)),
            ),
          ),
          const SizedBox(width: 12),
          // Texto entre el círculo y la clave
          const Text(
            "clave\ndinámica", // Texto informativo
            style: TextStyle(fontSize: 12, color: Color.fromARGB(255, 255, 255, 255)),
            textAlign: TextAlign.center, // Tamaño más pequeño
          ),
          const SizedBox(width: 10),
          // Texto con la clave dinámica
          Text(
            dynamicKey,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255),), 
          ),
          const SizedBox(width: 5),
          // Icono para copiar la clave al portapapeles
          IconButton(
            icon: const Icon(Icons.copy, size: 22,color: Color.fromARGB(255, 255, 255, 255)), 
            onPressed: () {
              Clipboard.setData(ClipboardData(text: dynamicKey));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Clave copiada al portapapeles")),
              );
            },
          ),
        ],
      ),
    );
  }
}
