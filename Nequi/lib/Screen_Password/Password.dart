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
    super.initState();
    txtClave1.addListener(() {});
    txtClave2.addListener(() {});
    txtClave3.addListener(() {});
    txtClave4.addListener(() {});
  }

  void _actualizarIntentos(int nuevosIntentos) {
    setState(() {
      intentos = nuevosIntentos <= 0 ? 3 : nuevosIntentos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E001F),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  InkWell(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                        color: const Color.fromRGBO(235, 232, 244, 1),
                        iconSize: 30,
                      ),
                    ),
                  ),
                  const InkWell(
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
                  Row(
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
                  const SizedBox(height: 40),
                  const Text(
                    "No dudamos que seas tú... \nPero es mejor confirmar ;)",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  buttons(),
                  const SizedBox(height: 15),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 1.8,
                          color: Colors.white,
                        ),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '¿Se te olvidó?',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 30,)
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget builderTextField(TextEditingController controller) {
    return SizedBox(
      width: 60,
      height: 60,
      child: TextField(
        controller: controller,
        obscureText: true,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Color.fromRGBO(235, 232, 244, 1),
          contentPadding: EdgeInsets.symmetric(vertical: 11.0),
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

  Widget buttons() {
    return SizedBox(
      width: 350,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                IconButton(
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
                  icon: const Icon(Icons.fingerprint, color: Colors.white),
                  iconSize: 38,
                ),
                buttonNum('0'),
                IconButton(
                  onPressed: () {
                    _borrarTexto();
                  },
                  icon: const Icon(Icons.backspace_rounded, color: Colors.white),
                  iconSize: 36,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buttonNum(String numTeclado) {
  return TextButton(
    child: Text(
      numTeclado,
      style: const TextStyle(
        fontSize: 35,
        color: Colors.white,
        fontFamily: 'TempusSansITC',
      ),
    ),
    onPressed: () {
      setState(() {
        if (txtClave1.text.isEmpty) {
          txtClave1.text = numTeclado;
        } else if (txtClave2.text.isEmpty) {
          txtClave2.text = numTeclado;
        } else if (txtClave3.text.isEmpty) {
          txtClave3.text = numTeclado;
        } else if (txtClave4.text.isEmpty) {
          txtClave4.text = numTeclado;
          if (txtClave1.text == '1' &&
              txtClave2.text == '2' &&
              txtClave3.text == '3' &&
              txtClave4.text == '4') {
            Future.delayed(const Duration(seconds: 1), () {
              txtClave1.clear();
              txtClave2.clear();
              txtClave3.clear();
              txtClave4.clear();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InitialPage()),
              );
            });
          } else {
            _actualizarIntentos(intentos - 1);

            // Llamar a la función showSnackBar aquí
            showSnackBar(context, intentos);

            Future.delayed(const Duration(seconds: 1), () {
              txtClave1.clear();
              txtClave2.clear();
              txtClave3.clear();
              txtClave4.clear();
            });
          }
        }
      });
    },
  );
}


  void _borrarTexto() {
    if (txtClave4.text.isNotEmpty) {
      txtClave4.clear();
    } else if (txtClave3.text.isNotEmpty) {
      txtClave3.clear();
    } else if (txtClave2.text.isNotEmpty) {
      txtClave2.clear();
    } else if (txtClave1.text.isNotEmpty) {
      txtClave1.clear();
    }
  }
}

void showSnackBar(BuildContext context, int intentos) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: 50.0, // Ajusta según sea necesario
      left: 10.0,
      right: 10.0,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFFFF3E60),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.report_problem,
                color: Color(0xFFFD8C9D),
                size: 35,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  '¡Ups! Esa no es tu clave, tranqui. tienes \n$intentos intentos más',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  overlay?.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}

