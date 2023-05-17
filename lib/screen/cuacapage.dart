import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobileagroapps/model/user_model.dart';
import 'package:mobileagroapps/controller/cuaca_controller.dart';
import 'package:mobileagroapps/controller/user_repo.dart';
import 'package:mobileagroapps/widget/cuaca/cuacatemp_widget.dart';
import 'package:mobileagroapps/widget/cuaca/forecuacapage.dart';
import 'package:mobileagroapps/widget/cuaca/saran.dart';
import 'package:provider/provider.dart';

class CuacaPage extends StatefulWidget {

  final int idx;
  CuacaPage({required this.idx});


  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context, listen: false).getCuacaAll();
    Provider.of<CuacaProvider>(context, listen: false).getForecastCuaca();

  }

  void _reloadCuaca() {
    Provider.of<CuacaProvider>(context, listen: false).getCuacaAll();
    Provider.of<CuacaProvider>(context, listen: false).getForecastCuaca();
  }

  @override
  Widget build(BuildContext context) {
    // final usrprov = Provider.of<UserProvider>(context);
    // usrprov.fethcdatauser();
    // final akunnya = usrprov.akun;
    // final useloclistdata = Provider.of<UserProvider>(context, listen: false);
    // useloclistdata.fetchdatauserlocation(akunnya[widget.idx].id);
    final weatherProvider = Provider.of<CuacaProvider>(context, listen: false);
    final formater = DateFormat.Hm();
    final formaterdate = DateFormat.yMMMd();
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                          contentPadding: EdgeInsets.all(30),
                          actionsPadding: EdgeInsets.all(30),
                          title: Text("Ubah Lokasi"),
                          content: Text("Masukkan Lokasi yang ingin dituju"),
                          actions: [
                            TextField(
                              onChanged: (value) {
                                weatherProvider.updateLocation(value);
                              },
                              decoration: InputDecoration(
                                  hintText: "masukkan lokasi ..."),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  _reloadCuaca();
                                  Navigator.of(context).pop();
                                },
                                child: Text("Ubah")),
                            
                          ],
                        ));
              },
              icon: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(
              padding: EdgeInsets.all(8),
              child: Image(image: AssetImage("images/logo_only.png"))),
          title: Text(
            "CUACA",
            style: GoogleFonts.poppins(color: Color.fromARGB(210, 0, 0, 0),),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 30),
            child:
                Consumer<CuacaProvider>(builder: (context, cuacaProvider, _) {
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
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(76, 100, 100, 100),
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 7.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("images/gr_gradient2.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Padding(padding: EdgeInsets.only(top:10)),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Text(
                                    "${(cuacaData.main.temp - 273.15).toStringAsFixed(0)}°",
                                    // overflow:TextOverflow.fade,
                                    // maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 70,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                ),
                                Text(
                                  '${formaterdate.format(DateTime.now())}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  cuacaData.kotanya.Kota,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          // Spacer(),
                          Expanded(
                            child: Column(
                              children: [
                                Container(
                                  width: 90,
                                  child: Image.network(
                                    "http://openweathermap.org/img/w/${cuacaData.cuacanya.first.icon}.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "Hari ini ${cuacaData.cuacanya.first.main}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  cuacaData.cuacanya.first.description,
                                  style: TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                              ],
                            ),
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
                    SizedBox(
                      height: 10,
                    ),

                    // ini adalah forecast untuk 5 hari kedepan per 3 jam 
                    ForecastCuacaPage(),
                    
                    CuacaTempWidget(
                        main: cuacaData.cuacanya.first.main,
                        description: cuacaData.cuacanya.first.description),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Saran",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 43, 101, 45)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: SaranTernakKebun(),
                    )
                  ],
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
