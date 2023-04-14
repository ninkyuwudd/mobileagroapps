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
    Provider.of<CuacaProvider>(context, listen: false).getCuacaAll();
  }

  @override
  Widget build(BuildContext context) {
    final formater = DateFormat.Hm();
    final formaterdate = DateFormat.yMMMd();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 220, 255, 221),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage("images/logo_only.png"))),
          title: Text(
            "CUACA",
            style: TextStyle(color: Color.fromARGB(210, 0, 0, 0)),
          ),
        ),
        // drawer: Drawer(
        //   child: ListView(
        //     children: [
        //       DrawerHeader(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage("images/farm_02.jpg"),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //         child: Text("Menu",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),)),
        //       ListTile(
        //         title: Text("Calculator"),
        //       )
        //     ],
        //   ),
        // ),
        body: Container(
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
          child: Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
            if (cuacaProvider.cuacadata == null) {
              return CircularProgressIndicator();
            } else {
              final cuacaData = cuacaProvider.cuacadata!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("images/gr_gradient2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${(cuacaData.main.temp - 273.15).toStringAsFixed(0)}°ᶜ",
                              style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                            Text(
                              '${formaterdate.format(DateTime.now())}',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              cuacaData.kotanya.Kota,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Image.network(
                                "http://openweathermap.org/img/w/${cuacaData.cuacanya.first.icon}.png"),
                            Text(
                              "Hari ini ${cuacaData.cuacanya.first.main}",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              cuacaData.cuacanya.first.description,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 10,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                    color: Color.fromARGB(174, 82, 82, 82),
                  ),
                  CuacaTempWidget(
                      main: cuacaData.cuacanya.first.main,
                      description: cuacaData.cuacanya.first.description),
                  SizedBox(height: 20,),
                  Text("Saran",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 20,color: Color.fromARGB(255, 43, 101, 45) ),),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(30, 76, 175, 79),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Peternakan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              Text("Jenis Pakan"),
                              SizedBox(height: 10,),
                              Text("Rumput",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                                            Expanded(
                        child: Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(30, 76, 175, 79),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Perkebunan",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                              Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                              Text("Jenis Pupuk"),
                              SizedBox(height: 10,),
                              Text("Pupuk Cair",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
