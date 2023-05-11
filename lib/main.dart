import 'package:flutter/material.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/provider/cuaca_service.dart';
import 'package:mobileagroapps/provider/order_provider.dart';
import 'package:mobileagroapps/provider/pilihfile_controller.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/provider/user_repo.dart';
import 'package:mobileagroapps/screen/change_user_data.dart';
import 'package:mobileagroapps/screen/login_page.dart';
import 'package:mobileagroapps/screen/register_page.dart';
import 'package:mobileagroapps/screen/shop/add_product.dart';
import 'package:mobileagroapps/screen/shop/cart_page.dart';
import 'package:mobileagroapps/screen/shop/detail_product.dart';
import 'package:mobileagroapps/screen/shop/order_product.dart';
import 'package:mobileagroapps/screen/shop/unggah_gambar.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  // final CuacaProvider _cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CuacaProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => Orderproivder()),
        ChangeNotifierProvider(create: (_) => PilihUploadfile())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // fontFamily:GoogleFonts.poppins(),
          
          primaryTextTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.green,
          
          textTheme: GoogleFonts.poppinsTextTheme(
            
            Theme.of(context).textTheme
            
          )
        ),
        home: LoginPage(),
        routes: {
          LoginPage.routename :(context) => LoginPage(),
          RegisterPage.routename :(context) => RegisterPage(),
          BottomNavbar.routename :(context) => BottomAppBar(),
          DetailProductScreen.routename :(context) => DetailProductScreen(),
          ProfileUserDataEditPage.routename :(context) => ProfileUserDataEditPage(),
          OrderProductPage.routename : (context) => OrderProductPage(),
          CartPage.routename :(context) => CartPage(),
          AddProductPage.routename : (context) => AddProductPage(),
          UnggahGambar.routename : (context) => UnggahGambar(),
        },
      ),
    );
  }
}

