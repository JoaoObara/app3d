import 'package:flutter/material.dart';

//
class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Demanda',
      style: optionStyle,
    ),
    Text(
      'Index 1: Estoque',
      style: optionStyle,
    ),
    Text(
      'Index 2: Calculadora',
      style: optionStyle,
    ),
    Text(
      'Index 3: Home',
      style: optionStyle,
    ),
    Text(
      'Index 4: Impressora',
      style: optionStyle,
    ),
    Text(
      'Index 5: Catalogo',
      style: optionStyle,
    ),
    Text(
      'Index 6: Wiki',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//Barra de navegação
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
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
