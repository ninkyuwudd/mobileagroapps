import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/screen/shop/testproduct.dart';
import 'package:provider/provider.dart';

class UnggahGambar extends StatefulWidget {
  static const routename = "/unggahgambar";
  const UnggahGambar({super.key});

  @override
  State<UnggahGambar> createState() => _UnggahGambarState();
}

class _UnggahGambarState extends State<UnggahGambar> {
  @override
  Widget build(BuildContext context) {
    var imgcontroller = Provider.of<PilihUploadfile>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Unggah Gambar"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    child: imgcontroller.pickfile == null
                        ? CircleAvatar(
                            backgroundImage: AssetImage("images/bebek@4x.png"),
                            radius: 70,
                          )
                        : CircleAvatar(
                            foregroundImage:
                                FileImage(File(imgcontroller.pickfile!.path!)),
                            radius: 70,
                          )),
                TextButton(
                    onPressed: () {
                      imgcontroller.selectFile();
                    },
                    child: Text("Ambil gambar"))
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  imgcontroller.uploadfile();
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Submit Data Successfully',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  ));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductView(namagambar: imgcontroller.pickfile!.name,)));
                },
                child: Text("Upload file"))
          ],
        ),
      ),
    );
  }
}
