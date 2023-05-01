import 'package:flutter/material.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/provider/cuaca_service.dart';
import 'package:mobileagroapps/provider/user_repo.dart';
import 'package:mobileagroapps/screen/change_user_data.dart';
import 'package:mobileagroapps/screen/login_page.dart';
import 'package:mobileagroapps/screen/register_page.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  final CuacaProvider _cuacaProvider = CuacaProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CuacaProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          
          textTheme: TextTheme(
            headline1: TextStyle(color: Colors.green),
            
          )
        ),
        home: LoginPage(),
        routes: {
          LoginPage.routename :(context) => LoginPage(),
          RegisterPage.routename :(context) => RegisterPage(),
          BottomNavbar.routename :(context) => BottomAppBar(),
          ProfileUserDataEditPage.routename :(context) => ProfileUserDataEditPage()
        },
      ),
    );
  }
}

