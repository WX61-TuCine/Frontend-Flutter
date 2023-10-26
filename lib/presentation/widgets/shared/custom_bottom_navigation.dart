import 'package:flutter/material.dart';
import 'package:tu_cine/presentation/screens/home/home_screen.dart';
import 'package:tu_cine/presentation/screens/profile/profile_screen.dart';
import 'package:tu_cine/presentation/screens/search/search_screen.dart';
import 'package:tu_cine/presentation/screens/tickets/my_tickets_screen.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const SearchScreen(),
      const MyTicketsScreen(),
      const ProfileScreen()
    ];

    return Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (newIndex) {
            setState(() {
              selectedIndex = newIndex;
            });
          },
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
        ));
  }
}
