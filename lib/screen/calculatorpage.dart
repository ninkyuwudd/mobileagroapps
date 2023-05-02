import 'package:flutter/material.dart';
import 'package:mobileagroapps/widget/kalkulator/tips_page.dart';
import '../widget/kalkulator/halaman_pakan.dart';
import '../widget/kalkulator/halaman_pupuk.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  int urutan = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      )
      ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                    setState(() {
                      urutan = 1;
                    });
                  }, child: Text("Pupuk")),
                  SizedBox(width: 15,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                      urutan = 2;
                    });
                  }, child: Text("Pakan")),
                ],
              ),
            ),
            urutan == 1? KalkulatorPupuk() : urutan == 2 ? KalkulatorPakan(): urutan == 3 ? TipsPage() : Container()
          ],
        ),
      )
    );
  }
}
