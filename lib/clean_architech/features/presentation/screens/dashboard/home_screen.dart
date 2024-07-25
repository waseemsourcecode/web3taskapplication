import 'package:flutter/material.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/screens/dashboard/Tabs/tab_home/tab_home.dart';
import 'package:web3shopping_app/clean_architech/features/presentation/screens/dashboard/tabs/tab_explore.dart';

import '../authorizatin/login/login_screen.dart';
import 'tabs/tab_fav.dart';
import 'tabs/tab_profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _StateHomeScreen();
  }

}
class _StateHomeScreen extends State <HomeScreen>{
   
  int _selectedIndex = 0; //New
 
//New
void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
static const List<Widget> _pages = <Widget>[
 TabHome(),
TabExplore(),
 TabFav(),
  TabProfile(),

];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
    bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      currentIndex: _selectedIndex, //New
  onTap: _onItemTapped,  
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.explore),
        label: 'Explore',
      ),
       BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favourite',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.verified_user),
        label: 'Profile',
      ),
    ],
  ),
    body: SafeArea(child: CustomPaint(
        painter: ContainerPatternPainter(),
      
      child: _pages.elementAt(_selectedIndex))),
   );
  }
  
}