import 'package:flutter/material.dart';
import 'package:tu_cine/config/constants/environment.dart';


class HomeScreen extends StatefulWidget {

  static const String routeName = 'home-screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Placeholder()
      ),    
    );
  }
}