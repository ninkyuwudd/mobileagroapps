import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/model/cuaca_model.dart';
import 'package:mobileagroapps/provider/cuaca_service.dart';
import 'package:mobileagroapps/widget/cuaca/cuacatemp_widget.dart';
import 'package:provider/provider.dart';



class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context,listen: false).getCuacaAll();
  }
  @override
  Widget build(BuildContext context) {
    final formater = DateFormat.Hm();
    final formaterdate = DateFormat.yMMMd();
    return Scaffold(
      appBar: AppBar(
        title: Text("cuaca"),

      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/farm_02.jpg"),
                fit: BoxFit.cover,
              ),
            ),
              child: Text("Menu",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),)),
            ListTile(
              title: Text("Calculator"),
            )
          ],
        ),
      ),
      body: Center(
        child: Consumer<CuacaProvider>(builder: (context,cuacaProvider,_)  {
          if(cuacaProvider.cuacadata == null){
            return CircularProgressIndicator();
          }else{
            final cuacaData = cuacaProvider.cuacadata!;
            return Column(
              children: [
                SizedBox(height: 20,),
                Text("Jember"),
                Text('${formaterdate.format(DateTime.now())}'),
                SizedBox(height: 20,),
                Text("${(cuacaData.main.temp - 273.15).toStringAsFixed(0)}°ᶜ",style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 102, 102, 102)),),
                SizedBox(height: 20,),
                CuacaTempWidget(main: cuacaData.cuacanya.first.main, description: cuacaData.cuacanya.first.description),

              
              ],
            );
          }
        }),
      ),
    );
  }
}