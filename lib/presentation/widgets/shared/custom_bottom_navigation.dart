import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget  {
  const CustomBottomNavigation({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            activeIcon: Icon(Icons.home_filled),
            label: 'Explorar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search_outlined),
            label: 'Buscar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            activeIcon: Icon(Icons.airplane_ticket_outlined),
            label: 'Ticket'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_outlined),
            label: 'Perfil'),
      ],
    );
  }
}
