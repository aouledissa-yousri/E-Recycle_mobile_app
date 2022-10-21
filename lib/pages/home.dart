import 'package:e_recycle/models/listMateriel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    const Text(
      ' Home',
      style: optionStyle,
    ),
    const Text(
      'notifications',
      style: optionStyle,
    ),
    ListMaterial(),
    const Text(
      'profile',
      style: optionStyle,
    ),
   const Text(
      'tri',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 15,
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(TablerIcons.leaf),
                  label: '',
                  
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.recycling),
                  label:''
          
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp),
                 label:''
                ),
                BottomNavigationBarItem(
                  icon: Icon(TablerIcons.layout_list),
                  label: '',
                ),
              ],
              currentIndex: _selectedIndex,
              iconSize: 50.0,
              backgroundColor: Colors.white,
              selectedItemColor: Color(0xff4ABB47),
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 100.0,
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}