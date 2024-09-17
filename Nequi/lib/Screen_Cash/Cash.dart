import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../Screen_Initial/Initial.dart';
import 'Balance.dart'; // Asegúrate de que la ruta sea correcta

class Nequituplata extends StatefulWidget {
  @override
  _NequituplataState createState() => _NequituplataState();
}

class _NequituplataState extends State<Nequituplata> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 41, 11, 37),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => InitialPage()),
            );
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Container(
        color: Color.fromARGB(255, 41, 11, 37), // Color de fondo
        child: Column(
          children: [
            // Contenido desplazable
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Así está tu plata',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Toda tu plata suma',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              '\$ 107.688,86',
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      // Tarjetas de saldo con tamaño personalizado y espacio
                      BalanceCard(
                        title: 'Disponible',
                        amount: '\$ 63.688,86',
                        icon: Icon(Ionicons.cash_outline, color: Colors.white, size: 30),
                        imageSize: 35,
                        color: Color(0xFF4C334E),
                        height: 85,
                      ),
                      BalanceCard(
                        title: 'Bolsillos',
                        amount: '\$ 44.000,00',
                        icon: Image.asset('assets/image/Bolsillos 2.png'),
                        imageSize: 35,
                        color: Color(0xFF4C334E),
                        height: 85,
                        trailingIcon: Ionicons.chevron_forward_outline,
                      ),
                      BalanceCard(
                        title: 'Colchón',
                        amount: '\$ 0,00',
                        icon: Image.asset('assets/image/Colchón 2.png'),
                        imageSize: 35,
                        color: Color(0xFF4C334E),
                        height: 85,
                        trailingIcon: Ionicons.chevron_forward_outline,
                      ),
                      BalanceCard(
                        title: 'Tarjeta',
                        amount: 'Saca tu Tarjeta Nequi',
                        icon: Image.asset('assets/image/Tarjeta 2.png'),
                        imageSize: 35,
                        color: Color(0x092D0C2C),
                        height: 85,
                        trailingIcon: Ionicons.chevron_forward_outline,
                      ),
                      BalanceCard(
                        title: 'Metas',
                        amount: 'Ahorra para un sueño acá',
                        icon: Image.asset('assets/image/Metas 2.png'),
                        imageSize: 35,
                        color: Color(0x092D0C2C),
                        height: 85,
                        trailingIcon: Ionicons.chevron_forward_outline,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sección expandible
            if (isExpanded)
              Container(
                height: MediaQuery.of(context).size.height * 0.8,
                color: Color(0xFF20103A),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        'Tus topes',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.expand_less, color: Colors.white),
                        onPressed: () {
                          setState(() {
                            isExpanded = false;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Aquí va la información adicional',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = true;
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 216, 215, 220),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0), // Ajusta el radio según lo necesites
                    topRight: Radius.circular(12.0), // Ajusta el radio según lo necesites
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tus topes',
                        style: TextStyle(color: Color(0xFF1E001F), fontSize: 18)),
                    Icon(Icons.expand_less, color: Color(0xFF1E001F), size: 35),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
