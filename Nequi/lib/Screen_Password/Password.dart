import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screen_Initial/Initial.dart';

// Variables de los controladores de cada TextField
final txtClave1 = TextEditingController(); 
final txtClave2 = TextEditingController(); 
final txtClave3 = TextEditingController(); 
final txtClave4 = TextEditingController(); 

class NequiClave extends StatefulWidget {
  NequiClave({super.key});

  @override
  _Nequi createState() => _Nequi();
}

class _Nequi extends State<NequiClave> {
  int intentos = 3; // Variable para los intentos restantes

  @override
  void initState() {
    super.initState(); // Variables para leer los TextField 
    txtClave1.addListener(() {});
    txtClave2.addListener(() {});
    txtClave3.addListener(() {});
    txtClave4.addListener(() {});
  }

  void _actualizarIntentos(int nuevosIntentos) {
    setState(() {
      if (nuevosIntentos <= 0) {
        // Si intentos es 0 o menos, reiniciar a 3
        intentos = 3;
      } else {
        intentos = nuevosIntentos;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E001F),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, // Permite desplazamiento vertical
        child: Column(
          children: [
            const SizedBox(height: 10),
            InkWell( // Icono de la flecha
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context); // Volver a la página anterior
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: const Color.fromRGBO(235, 232, 244, 1),
                  iconSize: 40,      
                ),
              ),
            ),
            const InkWell( // Texto de 'Escribe tu clave'
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Escribe tu clave',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Permite desplazamiento horizontal
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  builderTextField(txtClave1), // TextField cuadro 1
                  const SizedBox(width: 15),
                  builderTextField(txtClave2), // TextField cuadro 2
                  const SizedBox(width: 15),
                  builderTextField(txtClave3), // TextField cuadro 3
                  const SizedBox(width: 15),
                  builderTextField(txtClave4), // TextField cuadro 4
                ],
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "No dudamos que seas tú... \nPero es mejor confirmar ;)", 
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 180), 
            buttons(),
            const SizedBox(height: 30),
            Stack(
              children: [
                // Subrayado grueso
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 1.8, // Grosor del subrayado
                    color: Colors.white, // Color del subrayado
                  ),
                ),
                // Texto
                RichText(
                  text: const TextSpan(
                    text: '¿Se te olvidó?',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40)
          ],
        ),
      ),
    );
  }

  Widget builderTextField(TextEditingController controller) {
    return SizedBox( // Cuadro 2
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        obscureText: true, // Ocultar el texto del TextField 
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color.fromRGBO(235, 232, 244, 1), // Colocar fondo al TextField 
          contentPadding: EdgeInsets.symmetric(vertical: 11.0), // Ajusta el padding vertical
        ),
        obscuringCharacter: '*',
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromRGBO(219, 0, 129, 1),
          fontSize: 40,
        ),
      ),
    );
  }

  Widget buttons() { // Widget del teclado con los estilos en general  
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 70,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            buttonNum('1'),
            buttonNum('2'),
            buttonNum('3'),
            buttonNum('4'),
            buttonNum('5'),
            buttonNum('6'),
            buttonNum('7'),
            buttonNum('8'),
            buttonNum('9'),
            IconButton( // Huella 
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Autenticación de Huellas',
                        style: TextStyle(
                          color: Color.fromRGBO(51, 51, 51, 1),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0), // Bordes cuadrados
                      ),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: [
                            SizedBox(height: 5),
                            const Text(
                              'Confirma la huella digital para continuar',
                              style: TextStyle(
                                color: Color.fromRGBO(141, 141, 141, 1),
                                fontSize: 17
                              ),
                            ),
                            const SizedBox(height: 23),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.fingerprint,
                                    color: Colors.white,
                                  ),
                                  style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(Color.fromRGBO(107, 138, 151, 1)),
                                  ),
                                ),
                                const SizedBox(height: 10, width: 15),
                                const Text(
                                  'Sensor táctil',
                                  style: TextStyle(
                                    color: Color.fromRGBO(146, 146, 146, 1),
                                    fontSize: 14
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        Container(
                          margin: const EdgeInsets.only(right: 65), // Ajusta el margen a la derecha
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'CANCELAR',
                              style: TextStyle(
                                color: Color.fromRGBO(64, 133, 121, 1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }, 
              icon: Icon(Icons.fingerprint, color: Colors.white), // Icono de la huella del teclado 
              iconSize: 38,
            ),
            buttonNum('0'),
            IconButton( // Tecla de borrado
              onPressed: () {
                if (txtClave4.text.length > 0) {
                  txtClave4.text = (txtClave4.text.length > 0)
                    ? (txtClave4.text.substring(0, txtClave4.text.length - 1))
                    : "";
                } else if (txtClave3.text.length > 0) {
                  txtClave3.text = (txtClave3.text.length > 0)
                    ? (txtClave3.text.substring(0, txtClave3.text.length - 1))
                    : "";
                } else if (txtClave2.text.length > 0) {
                  txtClave2.text = (txtClave2.text.length > 0)
                    ? (txtClave2.text.substring(0, txtClave2.text.length - 1))
                    : "";
                } else if (txtClave1.text.length > 0) {
                  txtClave1.text = (txtClave1.text.length > 0)
                    ? (txtClave1.text.substring(0, txtClave1.text.length - 1))
                    : "";
                }
              },
              icon: const Icon(Icons.backspace_rounded, color: Colors.white),
              iconSize: 36,
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonNum(String numTeclado) { // Widget de los números del teclado 
    return TextButton(
      child: Text(
        numTeclado, 
        style: const TextStyle(
          fontSize: 43,
          color: Colors.white,
          fontFamily: 'TempusSansITC',
        ),
      ),
      onPressed: () {
        setState(() {
          if (txtClave1.text.length < 1) {
            txtClave1.text = txtClave1.text + numTeclado;
          } else if (txtClave2.text.length < 1) {
            txtClave2.text = txtClave2.text + numTeclado;
          } else if (txtClave3.text.length < 1) {
            txtClave3.text = txtClave3.text + numTeclado;
          } else if (txtClave4.text.length < 1) {
            txtClave4.text = txtClave4.text + numTeclado;
            if (txtClave1.text == '1' &&
                txtClave2.text == '2' &&
                txtClave3.text == '3' &&
                txtClave4.text == '4') {

              Future.delayed(Duration(seconds: 1), () {
                txtClave1.text = "";
                txtClave2.text = "";
                txtClave3.text = "";
                txtClave4.text = "";
                // Navegar a InitialPage sin rutas nombradas
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InitialPage()),
                );
              }); // Redirecciona a la página de inicio
            } else {
              _actualizarIntentos(intentos - 1); // Actualiza el número de intentos
              SnackBar snackBar = SnackBar(
                content: Row(
                  children: [
                    Icon(
                      Icons.report_problem,
                      color: Color(0xFFFD8C9D),
                      size: 35,
                    ),
                    SizedBox(width: 15),
                    Text(
                      '¡Ups! Esa no es tu clave, tranqui. tienes $intentos \nintentos más',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                duration: Duration(seconds: 1), // Ajusta la duración aquí
                backgroundColor: const Color(0xFFFF3E60),
                dismissDirection: DismissDirection.up,
                behavior: SnackBarBehavior.floating,
                margin: EdgeInsets.only(
                  bottom: 850,
                  left: 10,
                  right: 10,
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar); // Muestra el SnackBar
              Future.delayed(Duration(seconds: 1), () { 
                txtClave1.text = "";
                txtClave2.text = "";
                txtClave3.text = "";
                txtClave4.text = "";
              });
            }
          }
        });
      },
    );
  }
}
