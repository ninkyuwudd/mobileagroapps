import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/cart_provider.dart';
import 'package:mobileagroapps/provider/cuaca_service.dart';
import 'package:mobileagroapps/provider/kalkulator_controller.dart';
import 'package:mobileagroapps/provider/order_provider.dart';
import 'package:mobileagroapps/provider/pilihfile_controller.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:mobileagroapps/provider/user_repo.dart';
import 'package:mobileagroapps/route.dart';
import 'package:mobileagroapps/screen/login_page.dart';
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
        ChangeNotifierProvider(create: (_) => PilihUploadfile()),
        ChangeNotifierProvider(create: (_) => KalkulatorController())
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
        routes: Routes.route,
      ),
    );
  }
}

