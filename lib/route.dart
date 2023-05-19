import 'package:flutter/material.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/screen/change_user_data.dart';
import 'package:mobileagroapps/screen/login_page.dart';
import 'package:mobileagroapps/screen/profile/daftartoko_view.dart';
import 'package:mobileagroapps/screen/profile/premium_view.dart';
import 'package:mobileagroapps/screen/profile/uploadberhasil_view.dart';
import 'package:mobileagroapps/screen/profile/uploadtoko_view.dart';
import 'package:mobileagroapps/screen/register_page.dart';
import 'package:mobileagroapps/screen/shop/add_product.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/screen/shop/detail_product.dart';
import 'package:mobileagroapps/screen/shop/order_product.dart';
import 'package:mobileagroapps/screen/shop/perbayaran_view.dart';
import 'package:mobileagroapps/screen/shop/unggah_gambar.dart';

class Routes {
  // static const String loginPageRoute = LoginPage.routename;
  // static const String registerPageRoute = RegisterPage.routename;
  // static const String bottomNavbarRoute = BottomNavbar.routename;
  // static const String detailProductScreenRoute = DetailProductScreen.routename;
  // static const String profileUserDataEditPageRoute = ProfileUserDataEditPage.routename;
  // static const String orderProductPageRoute = OrderProductPage.routename;
  // static const String cartPageRoute = CartPage.routename;
  // static const String addProductPageRoute = AddProductPage.routename;
  // static const String unggahGambarRoute = UnggahGambar.routename;
  // static const String pembayaran = Pembayaran.routename;
  static final Map<String, WidgetBuilder> route = {
    LoginPage.routename: (context) => LoginPage(),
    RegisterPage.routename: (context) => RegisterPage(),
    BottomNavbar.routename: (context) => BottomAppBar(),
    DetailProductScreen.routename: (context) => DetailProductScreen(),
    ProfileUserDataEditPage.routename: (context) => ProfileUserDataEditPage(),
    OrderProductPage.routename: (context) => OrderProductPage(),
    CartPage.routename: (context) => CartPage(),
    AddProductPage.routename: (context) => AddProductPage(),
    UnggahGambar.routename: (context) => UnggahGambar(),
    Pembayaran.routename : (context) => Pembayaran(),
    DaftarPremium.routename : (context) => DaftarPremium(),
    DaftarToko.routename :(context) => DaftarToko(),
    MenungguPersetujuanToko.routename :(context) => MenungguPersetujuanToko(),
    Tokoditerima.routename :(context) => Tokoditerima()



  };
}
