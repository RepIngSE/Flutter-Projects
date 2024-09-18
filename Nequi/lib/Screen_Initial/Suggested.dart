import 'package:flutter/material.dart';

class SuggestedSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              
              Transform.translate(
             
                offset: Offset(-20, 0), 
                child: const Row(
                  children: [
                    SizedBox(width: 8), 
                    // Texto
                    Text(
                      'Sugeridos Nequi',
                      style: TextStyle(fontSize: 18, color: Color(0xFF1E001F)),
                    ),
                  ],
                ),
              )
            ]
          ), 

          SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SuggestedItem(icon: Image.asset('assets/image/Tarjeta 1.png'), label: 'Tarjeta', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/Paquetes 1.png'), label: 'Paquetes de \n celular', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/QR 1.png'), label: 'QR Negocios', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/Préstamos 1.png'), label: 'Préstamos', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/Facturas 1.png'), label: 'Otras \n facturas', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/PayPal 1.png'), label: 'Paypal', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/Claro 1.png'), label: 'Claro', imageSize: 52),
                SizedBox(width: 10),
                SuggestedItem(icon: Image.asset('assets/image/Servicios 1.png'), label: 'Más \n servicios', imageSize: 52),
                SizedBox(width: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Clase para cada ítem de la sección de sugeridos
class SuggestedItem extends StatelessWidget {
  final Widget icon; 
  final String label;
  final double imageSize; 

  const SuggestedItem({required this.icon, required this.label, required this.imageSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 85,  // Ajuste del ancho del contenedor
          height: 65, // Ajuste de la altura del contenedor
          decoration: BoxDecoration(
            color: const Color.fromARGB(0, 133, 28, 28), // Color de fondo
            borderRadius: BorderRadius.circular(8),
          ),
          child: Align( // Solo centra horizontalmente
            alignment: Alignment.topCenter, // Alineación en la parte superior centrada horizontalmente
            child: SizedBox(
              width: imageSize,
              height: imageSize,
              child: icon,
            ),
          ),
        ),
        
        // Definimos un SizedBox con altura fija para alinear los textos
        SizedBox(
          height: 40, 
          width: 85,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF1E001F),
            ),
            maxLines: 2, 
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
