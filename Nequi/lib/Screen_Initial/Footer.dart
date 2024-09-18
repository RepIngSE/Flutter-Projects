import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class FooterSection extends StatefulWidget {
  @override
  _FooterSectionState createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  // Variable para rastrear el ícono seleccionado
  IconData selectedIcon = Icons.home_sharp;

  // Método para manejar la selección de un ícono
  void _selectIcon(IconData icon) {
    setState(() {
      // Establece el ícono seleccionado
      selectedIcon = icon; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15), 
      child: Column(
        children: [
          // Scroll horizontal para los ítems del pie de página
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 4, left: 4, top: 4, bottom: 4), 
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
                  child: Row(
                    children: [
                      FooterItem(
                        icon: Icons.home_outlined,
                        selectedIcon: Icons.home_sharp, 
                        label: 'Inicio',
                        isSelected: selectedIcon == Icons.home_sharp,
                        onTap: () => _selectIcon(Icons.home_sharp),
                        selectedBackgroundColor: Color(0xFFEBE7F5),
                        defaultBackgroundColor: Colors.white,
                        isHomeIcon: true,
                      ),
                      SizedBox(width: 1),
                      // Ítem de pie de página con ícono 'Movimientos'
                      FooterItem(
                        icon: Icons.description_outlined,
                        selectedIcon: Icons.description_sharp,
                        label: 'Movimientos',
                        isSelected: selectedIcon == Icons.description_sharp,
                        onTap: () => _selectIcon(Icons.description_sharp),
                        selectedBackgroundColor: Color(0xFFEBE7F5),
                        defaultBackgroundColor: Colors.white,
                      ),
                      SizedBox(width: 1),
                      // Ítem de pie de página con ícono 'Servicios'
                      FooterItem(
                        icon: Ionicons.grid_outline,
                        selectedIcon: Ionicons.grid, 
                        label: 'Servicios',
                        isSelected: selectedIcon == Ionicons.grid,
                        onTap: () => _selectIcon(Ionicons.grid),
                        selectedBackgroundColor: Color(0xFFEBE7F5),
                        defaultBackgroundColor: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 68,
                  height: 69,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDB0083),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 253, 253, 253).withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "\$", 
                      style: TextStyle(
                        fontSize: 35,
                        color: Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Clase que representa un ítem del pie de página
class FooterItem extends StatelessWidget {
  final IconData icon; 
  final IconData selectedIcon; 
  final String label; 
  final bool isSelected; 
  final VoidCallback onTap; 
  final Color selectedBackgroundColor; 
  final Color defaultBackgroundColor; 
  final bool isHomeIcon; 

  FooterItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.selectedBackgroundColor,
    required this.defaultBackgroundColor,
    this.isHomeIcon = false, 
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 5),
        height: 60,
        width: 100,
        decoration: BoxDecoration(
          color: isSelected ? selectedBackgroundColor : defaultBackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              isSelected ? selectedIcon : icon,
              size: 30,
              color: Color(0xFF1E001F),
            ),
            SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF1E001F),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
              ),
            ),
          ],
        ),
      ),
    );
  }
}
