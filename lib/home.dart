import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(bottomNavigationBar: BottonNavigator());
  }
}

class BottonNavigator extends StatefulWidget {
  const BottonNavigator({super.key});

  @override
  State<BottonNavigator> createState() => _BottonNavigatorState();
}

class _BottonNavigatorState extends State<BottonNavigator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 55),
                  child: Text(
                    'Sismos',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                ),
              ],
            ),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("MAPA"),
                ),
                Tab(
                  child: Text("LISTA"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/googleMaps.png"),
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                      width: 100,
                      height: 40,
                      top: 600,
                      left: 110,
                      child: Container(
                        child: const FloatingActionButton.extended(
                        onPressed: null,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))),
                        backgroundColor: Color.fromARGB(255, 241, 140, 7),
                        label: Text("24 horas"),
                        icon: Icon(Icons.restart_alt),
                        foregroundColor: Colors.white,
                      ))),
                  Positioned(
                      width: 100,
                      height: 40,
                      left: 210,
                      top: 600,
                      child: Container(
                          child: const FloatingActionButton.extended(
                              onPressed: null,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                              backgroundColor: Color.fromARGB(255, 19, 16, 13),
                              label: Text("15 dias"),
                              icon: Icon(Icons.date_range_sharp),
                              foregroundColor: Colors.white)))
                ],
              ),
              const Center(
                child: Text("LISTA"),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.radar),
            label: 'Sismos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2),
            label: '¿Lo sentiste?',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Más',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
