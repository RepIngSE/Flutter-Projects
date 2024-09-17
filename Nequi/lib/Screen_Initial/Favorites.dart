import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/widgets.dart';

//Clase para la sección de favoritos 
// Clase para la sección de favoritos 
class FavoriteSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Ícono de corazón movido a la izquierda con Transform
              Transform.translate(
                // Mueve el contenido 20 píxeles hacia la izquierda
                offset: Offset(-20, 0), 
                child: const Row(
                  children: [
                    // Ícono de corazón
                    Icon(
                      Ionicons.heart_outline,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 20,
                    ),
                    SizedBox(width: 8), 
                    // Texto
                    Text(
                      'Tus favoritos',
                      style: TextStyle(fontSize: 18, color: Color(0xFF1E001F)),
                    ),
                  ],
                ),
              ),
              Spacer(), // Añade un Spacer para empujar el contenido a la derecha
              // Ícono de banda
              Icon(
                Ionicons.create_outline,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 28,
              ),
            ],
          ),
          SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                FavoriteItem(icon: Image.asset('assets/image/Tarjeta 1.png'), label: 'Tarjeta', imageSize: 62),
                SizedBox(width: 15),
                FavoriteItem(icon: Image.asset('assets/image/Colchón 1.png'), label: 'Colchón', imageSize: 62),
                SizedBox(width: 15),
                FavoriteItem(icon: Image.asset('assets/image/Bolsillos 1.png'), label: 'Bolsillos', imageSize: 62),
                SizedBox(width: 15),
                FavoriteItem(icon: Image.asset('assets/image/Metas 1.png'), label: 'Metas', imageSize: 68),
                SizedBox(width: 15),
                FavoriteItem(icon: Image.asset('assets/image/Agrega 1.png'), label: 'Agrega', imageSize: 68),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para cada ítem de la sección de favoritos
class FavoriteItem extends StatelessWidget {
  final Widget icon; 
  final String label;
  final double imageSize; 

  const FavoriteItem({required this.icon, required this.label, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 85,
          height: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          // Usa el widget icon aquí
          child: Center(
            child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: icon,
            ),
          ),
        ),
        SizedBox(height: 12),
        Text(label, style: TextStyle(fontSize: 17, color: Color(0xFF1E001F))),
      ],
    );
  }
}