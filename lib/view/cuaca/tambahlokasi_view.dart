import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/cuaca_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/model/datalokasi_model.dart';
import 'package:mobileagroapps/navigationbar.dart';
import 'package:mobileagroapps/widget/popup_warning.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:provider/provider.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class TambahLokasi extends StatefulWidget {
  static const routename = "/tambahlokasi";

  // final int idx;
  // TambahLokasi({super.key, required this.idx});

  @override
  State<TambahLokasi> createState() => _TambahLokasiState();
}

class _TambahLokasiState extends State<TambahLokasi> {
  String searchValue = '';
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  final firestoredb = FirebaseFirestore.instance.collection('users');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  bool ckusername = false;

  var lokasi = TextEditingController();
  bool cek = false;
  @override
  Widget build(BuildContext context) {
    var loadcuaca = Provider.of<CuacaProvider>(context);
    var loadidx = ModalRoute.of(context)?.settings.arguments as int;
    var loaduser = Provider.of<UserProvider>(context);
    var ambildata = loaduser.akun;
  
    return Scaffold(

      appBar: AppBar(
        title: Text("Tambah Lokasi"),
        // actions: [
        //   IconButton(onPressed: (){
        //     showSearch(context: context, delegate: customSearchDelegate());
        //   }, icon: Icon(Icons.search))
        // ],
      ),

      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tambah Lokasi Anda",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            RoundeValueFieldWhiteValue(
                fungsi:(value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            ckusername = true;
                          });
                        } else {
                          setState(() {
                            ckusername = false;
                          });
                        }

                      },
                control: lokasi,
                title: "",
                hover: "masukkan lokasi anda",
                check: cek),
            GestureDetector(
              onTap: ()async {
                try {
                  if (lokasi.text.isEmpty){
                    setState(() {
                      cek = true;
                    });
                  }else{
                    setState(() {
                      cek = false;
                    });
                    firestoredb
                      .doc(ambildata[loadidx].id)
                      .update({"lokasi": lokasi.text});
                      loadcuaca.updateLocation(lokasi.text);
                  Provider.of<CuacaProvider>(context, listen: false).getCuacaAll();
                  await Future.delayed(Duration(seconds: 2));
                  if(loadcuaca.cuacadata == null){
                    showDialog(context: context, builder: (context){
                      return PopupWarning(pesan: "Nama lokasi tidak ditemukan");
                    });
                  }else{
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbar(
                        idx: loadidx,
                      ),
                    ),
                  );
                  }
                    }
                  } catch (e) {
                    print("masih ada eror");
                  }
                },
                child: Container(
                  margin:
                      EdgeInsets.only(top: 10, right: 25, left: 25, bottom: 10),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("Tambahkan", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      );
  
  }
}



class customSearchDelegate extends SearchDelegate{

    final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  @override
  List<Widget> buildActions(BuildContext context){
    return[
      IconButton(onPressed:(){
        query = '';
      }, icon: Icon(Icons.clear)),

    ];
  }
    @override
  Widget buildLeading(BuildContext context){
    return 
      IconButton(onPressed:(){
        close(context, null);
      }, icon: Icon(Icons.arrow_back));

  }

  @override
  Widget buildSuggestions(BuildContext context){
    List<String> matchquery = [];
    for(var city in _suggestions){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context,idx){
      var result = matchquery[idx];
      return ListTile(
        title: Text(result),
      );
    });

  }
  
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchquery = [];
    for(var city in _suggestions){
      if(city.toLowerCase().contains(query.toLowerCase())){
        matchquery.add(city);
      }
    }
    return ListView.builder(
      itemCount: matchquery.length,
      itemBuilder: (context,idx){
      var result = matchquery[idx];
      return ListTile(
        title: Text(result),
      );
    });


  }


}