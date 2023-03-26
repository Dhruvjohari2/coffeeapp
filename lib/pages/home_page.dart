// ignore_for_file: prefer_const_constructors

import 'package:coffeeappui/pages/favorite.dart';
import 'package:coffeeappui/pages/notifications.dart';
import 'package:coffeeappui/pages/profile.dart';
import 'package:coffeeappui/pages/setting.dart';
import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  //list of coffee types
  final List coffeeType = [
    // [coffee type , isSelected ]
    [
      'cappucino',
      true,
    ],
    [
      'lattee',
      false,
    ],
    [
      'black',
      false,
    ],
    [
      'tea',
      false,
    ],
  ];
  // user tapped on coffee types
  void coffeeTypeSelected(int index) {
    setState(() {
      // this is for everything false;
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        // leading: Icon(Icons.menu),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.grey[700],
          child: ListView(
            children: [
              DrawerHeader(
                child: Center(
                  child: Text(
                    'L O G O',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text(
                  'favorite',
                  style: TextStyle(fontSize: 18),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => favorite()));
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text(
                  'notifications',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Settings',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Setting()));
                },
              ),
              // ListTile(
              //   leading: Icon(Icons.home),
              //   title: Text(
              //     'Settings',
              //     style: TextStyle(fontSize: 20),
              //   ),
              //   onTap: () {
              //     Navigator.of(context).push(
              //         MaterialPageRoute(builder: (context) => BottomNavBar()));
              //   },
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.add,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.notifications,
            size: 30,
            color: Colors.grey,
          ),
          Icon(
            Icons.settings,
            size: 30,
            color: Colors.grey,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.black,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            //find the best coffee for You
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("find the best coffee for you",
                  style: TextStyle(
                    fontSize: 36,
                  )),
            ),
            SizedBox(
              height: 25,
            ),
            //Search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'find your coffee..',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 25,
            ),

            // horizontal listview of coffee types
            Container(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffeeType.length,
                    itemBuilder: (context, index) {
                      return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        },
                      );
                    })),
            //horizontal listview of coffee tiles
            Expanded(
                child: ListView(
              scrollDirection: Axis.horizontal,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee-b.jpg',
                  coffeeName: 'lattee',
                  coffeePrice: '4.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cofee.jpg',
                  coffeeName: 'Mocha',
                  coffeePrice: '6.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee.jpg',
                  coffeeName: 'Espresso',
                  coffeePrice: '8.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee-be.jpg',
                  coffeeName: 'Americano',
                  coffeePrice: '10.20',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/coffee-beas.jpg',
                  coffeeName: 'Cappuccino',
                  coffeePrice: '12.20',
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
