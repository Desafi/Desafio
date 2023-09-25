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
      home: CadastroApp(),
    );
  }
}

class CadastroApp extends StatefulWidget {
  const CadastroApp({super.key});

  @override
  State<CadastroApp> createState() => _CadastroAppState();
}

class Cadastro {
  String? nome;
  String? email;
  String? tipo;
  String? senha;
  String? repetirSenha;

  Cadastro(this.nome, this.email, this.tipo, this.senha, this.repetirSenha);
}

class _CadastroAppState extends State<CadastroApp> {
  var _obscuro = true;
  var _obscuroRepetir = true;

  Cadastro cadastro = Cadastro("", "", "", "", "");

  TextEditingController senhaController = TextEditingController();
  TextEditingController repetirSenhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Treinador"), value: "Treinador"),
      DropdownMenuItem(child: Text("Atleta"), value: "Atleta"),
    ];
    String? selectValue = 'Treinador';

    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
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
                        return "Este campo é obrigatório!";
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
                        return "Este campo é obrigatório!";
                      }
                      cadastro.email = value;
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    value: selectValue,
                    items: menuItems,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5)),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onChanged: (String? value) {
                      selectValue = value;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   controller: senhaController,
                  //   obscureText: _obscuro,
                  //   decoration: InputDecoration(
                  //     suffixIcon: IconButton(
                  //       padding: const EdgeInsetsDirectional.only(end: 12.0),
                  //       icon: _obscuro
                  //           ? const Icon(Icons.visibility)
                  //           : const Icon(Icons.visibility_off),
                  //       onPressed: () {
                  //         setState(() {
                  //           _obscuro = !_obscuro;
                  //         });
                  //       },
                  //     ),
                  //     enabledBorder: const OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         width: 1,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //     fillColor: Colors.grey[200],
                  //     filled: true,
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Senha',
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Este campo é obrigatório!";
                  //     }
                  //     cadastro.senha = value;
                  //     return null;
                  //   },
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextFormField(
                  //   controller: repetirSenhaController,
                  //   obscureText: _obscuroRepetir,
                  //   decoration: InputDecoration(
                  //     suffixIcon: IconButton(
                  //       padding: const EdgeInsetsDirectional.only(end: 12.0),
                  //       icon: _obscuroRepetir
                  //           ? const Icon(Icons.visibility)
                  //           : const Icon(Icons.visibility_off),
                  //       onPressed: () {
                  //         setState(() {
                  //           _obscuroRepetir = !_obscuroRepetir;
                  //         });
                  //       },
                  //     ),
                  //     enabledBorder: const OutlineInputBorder(
                  //       borderSide: BorderSide(
                  //         width: 1,
                  //         color: Colors.grey,
                  //       ),
                  //     ),
                  //     fillColor: Colors.grey[200],
                  //     filled: true,
                  //     border: OutlineInputBorder(),
                  //     labelText: 'Repetir senha',
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return "Este campo é obrigatório!";
                  //     } else if (cadastro.senha != value) {
                  //       return "Senhas são diferentes!";
                  //     }
                  //     cadastro.repetirSenha = value;
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 23, 192, 204),

                        minimumSize: Size(200.0, 60.0), // Tamanho mínimo
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Borda arredondada
                        ),
                      ),
                      child: const Text('Cadastrar',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 197, 23, 0),
                        minimumSize: Size(200.0, 60.0), // Tamanho mínimo
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(15.0), // Borda arredondada
                        ),
                      ),
                      child: const Text('Cancelar',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      onPressed: () {},
                    ),
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
