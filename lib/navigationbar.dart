import 'package:flutter/material.dart';
import 'package:mobileagroapps/screen/calculatorpage.dart';
import 'package:mobileagroapps/screen/cuacapage.dart';
import 'package:mobileagroapps/screen/profile_page.dart';
import 'package:mobileagroapps/screen/shoppage.dart';
import 'package:mobileagroapps/screen/testing/tesprovider.dart';

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
      CuacaPage(idx: widget.idx,),
      CalculatorPage(idx: widget.idx),
      // Testproductdata(),
      ShopPage(),
      ProfileUserPage(
        idx: widget.idx,
      )
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pageOption[currentpage],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: BottomNavigationBar(
              selectedItemColor: Colors.green,
  unselectedItemColor: Colors.grey,
            backgroundColor: Colors.white,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Cuaca"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.nature), label: "Calculator"),
              BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Toko"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
            ],
            onTap: (int index) {
              setState(() {
                currentpage = index;
              });
            },
            currentIndex: currentpage,
          ),
        ),
      ),
    );
  }
}
