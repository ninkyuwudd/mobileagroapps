import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/tips_page.dart';
import 'package:provider/provider.dart';
import '../provider/user_repo.dart';
import '../widget/kalkulator/halaman_pakan.dart';
import '../widget/kalkulator/halaman_pupuk.dart';

class CalculatorPage extends StatefulWidget {
  final int idx;
  CalculatorPage({required this.idx});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int urutan = 0;  
  @override
  Widget build(BuildContext context) {
    final usrprov = Provider.of<UserProvider>(context);
    usrprov.fethcdatauser();
    final akunnya = usrprov.akun;
    final getdataakun = akunnya[widget.idx];
    print(getdataakun.status);
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title:  Text("Kalkulator",style: TextStyle(color: Colors.green),),
          actions: [
            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => TipsPage()));
            }, child: Text("Tips"))
          ],
          bottom: TabBar(tabs: [
            Text("Pupuk",style: TextStyle(color: Colors.green),),
            Text("Pakan",style: TextStyle(color: Colors.green),)
          ]),
        )
        ,
        body: TabBarView(children: [
          KalkulatorPupuk(),
          
          Container(child:getdataakun.status == "admin"? KalkulatorPakan() : Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.lock),
              SizedBox(
                height: 10,
              ),
              Text("This page for admin"),
            ],
          )))

        ])
      ),
    );
  }
}



// SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     ElevatedButton(onPressed: (){
//                       setState(() {
//                         urutan = 1;
//                       });
//                     }, child: Text("Pupuk")),
//                     SizedBox(width: 15,),
//                     ElevatedButton(onPressed: (){
//                       setState(() {
//                         urutan = 2;
//                       });
//                     }, child: Text("Pakan")),
//                   ],
//                 ),
//               ),
//               urutan == 1? KalkulatorPupuk() : urutan == 2 ? KalkulatorPakan(): urutan == 3 ? TipsPage() : Container()
//             ],
//           ),
//         )