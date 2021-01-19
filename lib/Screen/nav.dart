import 'package:flutter/material.dart';

class Nav extends StatefulWidget{
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav>{
  int _selectindex =0;
  List<Widget> _widgetOptions = <Widget>[
    Text("Home"),
    Text("Message"),
    Text("profile")
  ];
  void _onItemTap(int index)
  {
    setState(() {
      _selectindex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectindex),
      ),
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: Colors.blue,
        fixedColor: Colors.white,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.handyman_rounded),title: Text("data")),
          BottomNavigationBarItem(icon: Icon(Icons.access_alarm_outlined),title: Text("data")),

        ],

        currentIndex: _selectindex,
        onTap: _onItemTap,
      ),
    );
  }

}