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

class Cadastro {
  String? nome;
  String? email;
  String? senha;
  String? repetirSenha;

  Cadastro(this.nome, this.email, this.senha, this.repetirSenha);
}


class _LoginAppState extends State<LoginApp> {
  var _obscuro = true;
  var _obscuroRepetir = true;


  Cadastro cadastro = Cadastro("", "", "", "");

  TextEditingController senhaController = TextEditingController();
  TextEditingController repetirSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
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
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo é obrigatório";
                      }
                      cadastro.nome = value;
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Nome Completo',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: false,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo é obrigatório";
                      }
                      cadastro.email = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: senhaController,
                    obscureText: _obscuro,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        icon: _obscuro
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscuro = !_obscuro;
                          });
                        },
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo é obrigatório";
                      }
                      cadastro.senha = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: repetirSenhaController,
                    obscureText: _obscuroRepetir,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        padding: const EdgeInsetsDirectional.only(end: 12.0),
                        icon: _obscuroRepetir
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _obscuroRepetir = !_obscuroRepetir;
                          });
                        },
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        ),
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Repetir senha',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo é obrigatório";
                      }
                      cadastro.repetirSenha = value;
                      return null;
                    },
                  ),



                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: Size(200.0, 60.0), // Tamanho mínimo
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15.0), // Borda arredondada
                      ),
                    ),
                    child: const Text('Iniciar',
                        style: TextStyle(color: Colors.white, fontSize: 20)),

                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );

                      }
                    },
                    ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
