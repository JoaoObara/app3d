import 'package:flutter/material.dart';

//
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 3;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
        switch (index) {
          case 0:
            Navigator.of(context).pushNamed("/demandaList");
            break;
        }
      },
    );
  }

//Barra de navegação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.date_range),
            activeIcon: Icon(Icons.date_range_outlined),
            label: 'Demanda',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storage),
            activeIcon: Icon(Icons.storage_outlined),
            label: 'Estoque',
            backgroundColor: Colors.brown,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            activeIcon: Icon(Icons.calculate_outlined),
            label: 'Calculadora',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.deepPurple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.print),
            activeIcon: (Icon(Icons.print_outlined)),
            label: 'Impressora',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            activeIcon: Icon(Icons.list_alt_outlined),
            label: 'Catalogo',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            activeIcon: (Icon(Icons.book_outlined)),
            label: 'Wiki',
            backgroundColor: Colors.pink,
          ),
        ],
        //Navegação
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
