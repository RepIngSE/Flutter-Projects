import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:math';
import '../Screen_Cash/Cash.dart'; // Necesario para las transformaciones y ángulos
import 'Favorites.dart'; // Asegúrate de que la ruta sea correcta
import 'Footer.dart'; // Asegúrate de que la ruta sea correcta
import 'Hexagon.dart'; // Asegúrate de que la ruta sea correcta
import 'Suggested.dart'; // Asegúrate de que la ruta sea correcta

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  bool visible = false;
  String numero = "107.688,86";

  void servicio() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          // Hexágonos rotados (fuera del ScrollView)
          Positioned(
            top: -290,
            left: -100,
            child: Transform.rotate(
              angle: pi / 5,
              child: Container(
                width: 650,
                height: 600,
                child: HexagonWidget(
                  angles: const [
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6
                  ],
                  color: const Color(0xFFDB0083),
                ),
              ),
            ),
          ),
          Positioned(
            top: -295,
            left: (MediaQuery.of(context).size.width / 2 - 600 / 2) + 5,
            child: Transform.rotate(
              angle: pi / 16,
              child: Container(
                width: 600,
                height: 600,
                child: HexagonWidget(
                  angles: const [
                    2 * pi / 6,
                    2 * pi / 7,
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6,
                    2 * pi / 6
                  ],
                  color: const Color(0xFF1E001F),
                ),
              ),
            ),
          ),

          // Sección desplazable
          Positioned(
            top: 300,
            left: 0,
            right: 0,
            bottom: 0, // Añadido para que el ScrollView ocupe el espacio restante
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100,),
                  // Sección de favoritos
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: FavoriteSection(),
                  ),
                  // Sección de sugeridos
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: SuggestedSection(),
                  ),
                  // Footer o barra de estado
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: FooterSection(),
                  ),
                ],
              ),
            ),
          ),

          // Otros elementos fijos (ej. perfil, botones, etc.)
          Positioned(
            top: 20,
            left: 20,
            child: InkWell(
              child: Container(
                width: 47,
                height: 49,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(55, 255, 255, 255),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  FontAwesomeIcons.user,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 30,
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 85,
            child: InkWell(
              child: Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hola, ", style: TextStyle(color: Colors.white, fontSize: 16.5)),
                    Text("Sara ", style: TextStyle(color: Colors.white, fontSize: 21))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Row(
              children: [
                Container(
                  width: 45,
                  height: 45,
                  child: const Icon(
                    FontAwesomeIcons.bell,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 45,
                  height: 45,
                  child: const Icon(
                    FontAwesomeIcons.question,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 30,
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: 45,
                  height: 45,
                  child: const Icon(
                    Icons.lock_outline_rounded,
                    color: Color.fromARGB(162, 248, 243, 243),
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 100,
            right: 0,
            left: 0,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  InkWell(
                    onTap: servicio,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Depósito Bajo Monto  ",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Icon(
                          visible ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          size: 13,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 3),
                  InkWell(
                    onTap: servicio,
                    child: Text(
                      "\$ " + (visible ? numero : "*****"),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    child: Text(
                      "Total \$ " + (visible ? numero : "*****"),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Nequituplata()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.5),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Tu plata   ", style: TextStyle(color: Colors.white)),
                          Icon(
                            Ionicons.chevron_down_outline,
                            color: Color.fromARGB(255, 255, 255, 255),
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
