import 'package:flutter/material.dart';
import 'package:tu_cine/LogIn/appBarTuCine.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    return Scaffold(
      appBar: TuCineAppBar().getAppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 10),
            const SizedBox(
              width: 300,
              child: Column(
                children: [
                  Text(
                    'Olvidaste tu contraseña?',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Ingrese el correo electrónico que utilizó para crear su cuenta para que podamos enviarle instrucciones sobre cómo restablecer su contraseña.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                child: const Text('Enviar')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.deepOrangeAccent,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  minimumSize: const Size(300, 50),
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                ),
                child: const Text('Volver')),
          ]),
        ),
      ),
    );
  }
}
