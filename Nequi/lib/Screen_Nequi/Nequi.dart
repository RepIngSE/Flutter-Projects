import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Screen_Nequi/Dynamic.dart';
import 'package:flutter_application_1/Screen_Password/Password.dart';

class NequiOnset extends StatefulWidget {
  const NequiOnset({Key? key}) : super(key: key);

  @override
  _NequiOnSetState createState() => _NequiOnSetState();
}

class _NequiOnSetState extends State<NequiOnset> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isPhoneValid = true;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF1E001F),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: <Widget>[
                            _buildTopRow(),
                            Expanded(flex: 5, child: _buildNequiLogo()),
                            _buildPhoneInput(constraints.maxWidth),
                            _buildEntrarButton(constraints.maxWidth),
                            Expanded(flex: 2, child: _buildBottomRow()),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 10,
                    child: DynamicKeyWidget(),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow() {
    return const Padding(
      padding: EdgeInsets.only(top: 30.0, left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.question_mark, color: Colors.white),
              SizedBox(width: 15),
              Icon(Icons.verified_user, color: Colors.white),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildNequiLogo() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.translate(
            offset: const Offset(0, -20),
            child: Container(
              width: 15,
              height: 15,
              color: Colors.pink,
            ),
          ),
          const SizedBox(width: 5),
          const Text(
            "Nequi",
            style: TextStyle(
              fontSize: 80,
              color: Colors.white,
              fontFamily: 'bold',
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneInput(double maxWidth) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20, right: 20),
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth * 0.9),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    '+57 | ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                hintText: 'Número de Celular',
                hintStyle: const TextStyle(color: Colors.white),
                fillColor: const Color.fromARGB(13, 241, 235, 235),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                      color: _isPhoneValid ? Colors.transparent : Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                      color: _isPhoneValid ? Colors.transparent : Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(
                      color: _isPhoneValid ? Colors.transparent : Colors.red),
                ),
              ),
            ),
            if (!_isPhoneValid)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildEntrarButton(double maxWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: maxWidth * 0.9),
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            onPressed: () {
              _validatePhoneNumber();
              if (_isPhoneValid) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NequiClave()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 243, 33, 163),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            child: const Text(
              'ENTRAR',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void _validatePhoneNumber() {
    setState(() {
      if (_phoneController.text.isEmpty) {
        _isPhoneValid = false;
        _errorMessage = '¡Ups! Debes escribir un número de cel válido.';
      } else if (_phoneController.text.length != 10) {
        _isPhoneValid = false;
        _errorMessage = '¡Ups! Debes escribir un número de 10 dígitos.';
      } else {
        _isPhoneValid = true;
        _errorMessage = '';
      }
    });
  }

  Widget _buildBottomRow() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomItem(Icons.qr_code, "Usa tu QR"),
          _buildBottomItem(Icons.payments, "Paga en Datáfono"),
          Row(
            children: [
              const Text("By", style: TextStyle(color: Colors.white)),
              const SizedBox(width: 3),
              Image.asset(
                'assets/image/bancolombia.png',
                width: 20,
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
