import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/view/shop/testproduct.dart';
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
    var gettokoid = ModalRoute.of(context)?.settings.arguments as String;
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
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    image:imgcontroller.pickfile == null?DecorationImage(image: AssetImage("images/empty.jpg"),fit: BoxFit.cover): DecorationImage(image: FileImage(File(imgcontroller.pickfile!.path!)),fit: BoxFit.cover)
                  ),
                    child: imgcontroller.pickfile == null
                        ? CircleAvatar(
                            backgroundImage: AssetImage("images/empty.jpg"),
                            
                            radius: 70,
                          )
                        : CircleAvatar(
                            foregroundImage:
                                FileImage(File(imgcontroller.pickfile!.path!)),
                            radius: 70,
                          )
                          ),
                          SizedBox(width: 10,),
                TextButton(
                    onPressed: () {
                      imgcontroller.selectFile();
                    },
                    child: Text("Ambil gambar"))
              ],
            ),
            SizedBox(height: 20,),
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
               
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProductView(namagambar: imgcontroller.pickfile!.name,idtoko: gettokoid)));
                },
                child: Text("Upload file"))
          ],
        ),
      ),
    );
  }
}
