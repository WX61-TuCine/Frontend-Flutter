import 'package:flutter/material.dart';
import 'package:tu_cine/infrastructure/datasources/APITuCine/user_tucine_datasource.dart';
import 'package:tu_cine/presentation/screens/auth/sign-in.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';

import 'appBarTuCine.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;

  Future<bool> loginRequest() async {
    final userTuCineDataSource api;
    api = userTuCineDataSource();
    final user =
        await api.getUserByEmailAndPassword(_emailController.text, _passwordController.text);
    if (user == null) {
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o contraseña incorrectos'),
        ),
      );
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TuCineAppBar().getAppBar(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                const SizedBox(height: 16.0),
                const Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tienes una cuenta?',
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignIn(),
                          ),
                        );
                      },
                      child: Text('Regístrate',
                          style: TextStyle(color: Colors.orangeAccent)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            // [Name]
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Correo',
                border: OutlineInputBorder(),
              ),
            ),
            // spacer
            const SizedBox(height: 12.0),
            // [Password]
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
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
            const SizedBox(height: 5.0),
            // Miss your password text button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const ForgotPassword(),
                  //   ),
                  // );
                },
                child: const Text('¿Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.orangeAccent)),
              ),
            ),
            const SizedBox(height: 12.0),
            OverflowBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    minimumSize: const Size(300, 50),
                  ),
                  onPressed: () async {
                    if (await loginRequest()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text('Iniciar Sesión'),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            //   Divider
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
                    primary: Colors.redAccent,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.g_mobiledata),
                ),
                const SizedBox(width: 12.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
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
          ],
        ),
      ),
    );
  }
}
