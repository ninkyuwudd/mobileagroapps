import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/calculatorpage.dart';
import 'package:mobileagroapps/screen/cuacapage.dart';
import 'package:mobileagroapps/screen/profile_page.dart';
import 'package:mobileagroapps/screen/shoppage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



class BottomNavbar extends StatefulWidget {
  final int idx;
  BottomNavbar({required this.idx});
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
      ProfileUserPage(idx: widget.idx,)
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pageOption[currentpage],
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          
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
      ),
    );
  }
}