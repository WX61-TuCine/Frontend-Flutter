import 'package:flutter/material.dart';
import 'package:tu_cine/domain/entities/user.dart';
import 'package:tu_cine/infrastructure/datasources/user_tucine_datasource.dart';
import 'package:tu_cine/infrastructure/models/apiTuCine/cineclub_response.dart';
import 'package:tu_cine/presentation/screens/auth/log-in.dart';

import 'appBarTuCine.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String? _gender = 'Masculino';
  String? _typeUser = 'Cinefilo';
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dniController = TextEditingController();
  final _birthdayController = TextEditingController();
  final _passwordController = TextEditingController();
  bool hidePassword = true;
  bool termsValue = false;

  // Methods
  Future<bool> signUpRequest() async {
    final userTuCineDataSource api;
    api = userTuCineDataSource();
    final userRequest = await api.createUser(UserPost(
      _firstNameController.text,
      _lastNameController.text,
      _emailController.text,
      _phoneController.text,
      _dniController.text,
      _passwordController.text,
      _birthdayController.text,
      _gender,
      _typeUser,
    ));
    if (userRequest == false) {
      // Scaffold Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Alguno de los valores ingresados es incorrecto'),
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
        body: SingleChildScrollView(
          child: Padding(
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
                          Navigator.pop(context);
                        },
                        child: const Text('Iniciar Sesión',
                            style: TextStyle(color: Colors.orangeAccent)),
                      ),
                    ],
                  ),
                  Column(children: [
                    TextField(
                      controller: _firstNameController,
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
                      controller: _phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _dniController,
                      decoration: const InputDecoration(
                        labelText: 'DNI',
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
                    const SizedBox(height: 12.0),
                    TextField(
                      controller: _birthdayController,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Nacimiento',
                        hintText: 'AAAA/MM/DD',
                        border: OutlineInputBorder(),
                      ),
                      onTap: () async {
                        DateTime? date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        );

                        if (date != null) {
                          _birthdayController.text = transformDate(date);
                        }
                      },
                    ),
                    const SizedBox(height: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Género',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Radio<String>(
                                    value: 'MALE',
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'FEMALE',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Radio<String>(
                                    value: 'Femenino',
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Femenino',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Radio<String>(
                                    value: 'OTHER',
                                    groupValue: _gender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _gender = value;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Otro',
                                    style: TextStyle(fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Tipo de Usuario',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: const Text(
                                  'Cinéfilo',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                leading: Radio<String>(
                                  value: 'CINEPHILE',
                                  groupValue: _typeUser,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _typeUser = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: const Text(
                                  'Cineclub',
                                  style: TextStyle(fontSize: 15.0),
                                ),
                                leading: Radio<String>(
                                  value: 'BUSINESS',
                                  groupValue: _typeUser,
                                  onChanged: (String? value) {
                                    setState(() {
                                      _typeUser = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
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
                      onPressed: () async {
                        if (await signUpRequest()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        }
                      },
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
          ),
        ));
  }

  String transformDate(DateTime date) {
    return '${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
