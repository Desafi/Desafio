import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginApp(),
    );
  }
}

class LoginApp extends StatefulWidget {
  const LoginApp({super.key});

  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  textAlign: TextAlign.start,
                  'Cadastre um usuário',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                  ),
                ),
                Text(
                  'Preencha as informações:',
                  style: GoogleFonts.plusJakartaSans(
                    textStyle:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                ),
                TextField(
                  obscureText: false,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.grey,
                      ),
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'E-mail',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
