import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/calculatorpage.dart';
import 'package:mobileagroapps/screen/cuacapage.dart';
import 'package:mobileagroapps/screen/profilepage.dart';
import 'package:mobileagroapps/screen/shoppage.dart';



class BottomNavbar extends StatefulWidget {
  // const BottomNavbar({super.key});
  static const routename = "/navigatorbar";

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    final _pageOption = [
      CuacaPage(),
      CalculatorPage(),
      ShopPage(),
      ProfilePage()
    ];
    return Scaffold(
      body: _pageOption[currentpage],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "Cuaca"),
          NavigationDestination(icon: Icon(Icons.nature), label: "Calculator"),
          NavigationDestination(icon: Icon(Icons.shop), label: "Toko"),
          NavigationDestination(icon: Icon(Icons.person), label: "Profile")
        ],
        onDestinationSelected: (int index){
          setState(() {
            currentpage = index;
          });
        },
        selectedIndex: currentpage,
      ),
    );
  }
}