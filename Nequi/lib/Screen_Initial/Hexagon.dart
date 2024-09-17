import 'package:flutter/material.dart';
import 'dart:math';

//para formar las figuras en este caso depende de la informacion que se les pase
class HexagonWidget extends StatelessWidget {
  final List<double> angles;
  final Color color;

  HexagonWidget({required this.angles, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(double.infinity, double.infinity), // Usa el tamaño del contenedor
      painter: HexagonPainter(angles: angles, color: color),
    );
  }
}

class HexagonPainter extends CustomPainter {
  final List<double> angles;
  final Color color;

  HexagonPainter({required this.angles, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(size.width, size.height) / 2;

    double currentAngle = 0.0;

    // Dibuja el hexágono con ángulos personalizados
    for (int i = 0; i < angles.length; i++) {
      final angle = angles[i];
      final x = centerX + radius * cos(currentAngle);
      final y = centerY + radius * sin(currentAngle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      currentAngle += angle;
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}