import 'package:flutter/material.dart';
import 'package:ontrend/features/food/screens/food_page.dart';
import 'package:ontrend/features/home/screens/test_page.dart';

import '../../../main.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List pages= [
    TestPage(),
    FoodPage(),
    TestPage(),
    TestPage(),
    TestPage(),
  ];
  int index =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: pages[index],
      bottomNavigationBar: ClipRRect(
        borderRadius:  BorderRadius.only(
          topRight: Radius.circular(w*0.04),
          topLeft: Radius.circular(w*0.04),
        ),
        child: BottomNavigationBar(
          showUnselectedLabels: true,

          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
            color: Colors.red
          ),
          elevation: 2,
          backgroundColor: Colors.grey,
          currentIndex: index,
            onTap: (value) {
              index =value;
              setState(() {

              });
            },
            selectedItemColor: Colors.blue.shade800,
            selectedIconTheme: IconThemeData(color: Colors.blue.shade800),
            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
          ), BottomNavigationBarItem(
              icon: Icon(Icons.fastfood),
              label: 'Food'
          ) ,BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Shop'
          ), BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined,),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,),
              label: 'Profile'
          )
        ]),
      ),
    );
  }
}
