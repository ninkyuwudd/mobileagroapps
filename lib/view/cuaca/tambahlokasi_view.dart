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
      appBar: EasySearchBar(
        title: Text("Lokasi"),
        onSearch: (value) => setState(() => searchValue = value),
        suggestions: dataListlokasi,
        leading: Text(""),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Tambah Lokasi Anda",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text('Value: $searchValue'),
              GestureDetector(
                onTap: () {
                  try {
                    if (searchValue.isEmpty) {
                      showDialog(context: context, builder: (context){
                        return PopupWarning(pesan: "Lokasi tidak bisa kosong !");
                      });
                    } else {
      
                      firestoredb
                          .doc(ambildata[loadidx].id)
                          .update({"lokasi": searchValue});
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavbar(
                            idx: loadidx,
                          ),
                        ),
                      );
                      loadcuaca.updateLocation(lokasi.text);
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
      ),
    );
  }
}
