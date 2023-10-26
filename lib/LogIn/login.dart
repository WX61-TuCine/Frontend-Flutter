import 'package:flutter/material.dart';
import 'package:tu_cine/LogIn/appBarTuCine.dart';
import 'package:tu_cine/LogIn/forgotPassword.dart';
import 'package:tu_cine/LogIn/signIn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;

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
                Text(
                  'Bienvenido de nuevo',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPassword(),
                    ),
                  );
                },
                child: const Text('¿Olvidaste tu contraseña?',
                    style: TextStyle(color: Colors.orangeAccent)
                ),
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
                  onPressed: () {
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
              //   Make a Circular Button without text
              //   and with a Facebook icon
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
