import 'package:flutter/material.dart';
import 'package:tu_cine/LogIn/login.dart';

import 'appBarTuCine.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  bool termsValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TuCineAppBar().getAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                const Text(
                  'Crear Cuenta',
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿Ya tienes una cuenta?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Iniciar Sesión',
                          style: TextStyle(color: Colors.orangeAccent)),
                    ),
                  ],
                ),
                Column(children: [
                  TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nombres',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(
                      labelText: 'Apellidos',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Correo',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                    ),
                    obscureText: hidePassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: termsValue,
                        onChanged: (value) {
                          setState(() {
                            termsValue = value!;
                          });
                        },
                      ),
                      const Text(
                        'Acepto los',
                        style: TextStyle(fontSize: 11.0),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: const Text(
                            'Términos de servicio y Políticas de privacidad',
                            style: TextStyle(
                                color: Colors.orangeAccent, fontSize: 11.0)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(300, 50),
                    ),
                    onPressed: () {},
                    child: const Text('Crear Cuenta',
                        style: TextStyle(fontSize: 16.0)),
                  ),
                  const SizedBox(height: 12.0),
                  const Divider(
                    height: 20,
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const SizedBox(height: 12.0),
                  //   Buttons for Gmail and Facebook with
                  //   their respective icons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.g_mobiledata),
                      ),
                      const SizedBox(width: 12.0),
                      //   Make a Circular Button without text
                      //   and with a Facebook icon
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          elevation: 8.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Icon(Icons.facebook),
                      ),
                    ],
                  ),
                ])
              ],
            ),
          ),
        ));
  }
}