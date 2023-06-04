import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/user_controller.dart';
import 'package:mobileagroapps/view/shop/cart_page_view.dart';
import 'package:mobileagroapps/view/shop/listproduk_view.dart';
import 'package:mobileagroapps/widget/popup_widget.dart';
import 'package:mobileagroapps/widget/rounded_value_field.dart';
import 'package:mobileagroapps/widget/rounded_value_filed_intcek.dart';
import 'package:provider/provider.dart';

class EditProdukView extends StatefulWidget {
  // const DetailProduct({super.key});
  static const routename = '/editproductdetail';

  @override
  State<EditProdukView> createState() => _EditProdukViewState();
}

class _EditProdukViewState extends State<EditProdukView> {
  bool ckharga = false;
  bool ckintharga = false;
  bool ckjduul = false;
  bool ckstok = false;
  bool ckintstok = false;
  bool ckdeskripsi = false;
  var harga = TextEditingController();
  var judul = TextEditingController();
  var stok = TextEditingController();
  var deskripsi = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final produkid = ModalRoute.of(context)?.settings.arguments as String;
      final load = Provider.of<ProductProvider>(context, listen: false);
      final loadproduk = load.finbyid(produkid);
      harga.text = loadproduk.harga.toString();
      judul.text = loadproduk.namaproduk.toString();
      stok.text = loadproduk.jumlah.toString();
      deskripsi.text = loadproduk.deskripsi.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    final loaduser = Provider.of<UserProvider>(context);
    final produkid = ModalRoute.of(context)?.settings.arguments as String;
    final load = Provider.of<ProductProvider>(context);
    final loadproduk = load.finbyid(produkid);

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Detail Product"),
        actions: [
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Popup(yesfunc: () {
                      load.deleteitem(produkid);
                      Navigator.pushReplacementNamed(
                          context, ListProdukView.routename,
                          arguments: loaduser.curidx);
                    }, nofunc: () {
                      Navigator.pop(context);
                    });
                  },
                );
              },
              child: Text(
                "Hapus",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height - 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  loadproduk.gambar,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RoundeValueFieldWhiteValueIntcek(
                      control: harga,
                      title: "Harga",
                      hover: "masukkan harga",
                      check: ckharga,
                      checkInt: ckintharga,
                      fungsi: (value) {
                        if (value != "" && int.tryParse(value) == null) {
                          print("salah input");
                          setState(() {
                            ckintharga = true;
                            ckharga = false;
                          });
                        } else if (value == "") {
                          print("kosong");
                          setState(() {
                            ckintharga = false;
                            ckharga = true;
                          });
                        } else {
                          print("oke");
                          setState(() {
                            ckintharga = false;
                            ckharga = false;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundeValueFieldWhiteValue(
                      control: judul,
                      title: "Judul",
                      hover: "masukkan judul...",
                      check: ckjduul,
                      fungsi: (value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            ckjduul = true;
                          });
                        } else {
                          setState(() {
                            ckjduul = false;
                          });
                        }
                      },
                    ),
                    RoundeValueFieldWhiteValueIntcek(
                      control: stok,
                      title: "Stok",
                      hover: "masukkan jumlah stok...",
                      check: ckstok,
                      checkInt: ckintstok,
                      fungsi: (value) {
                        if (value != "" && int.tryParse(value) == null) {
                          print("salah input");
                          setState(() {
                            ckintstok = true;
                            ckstok = false;
                          });
                        } else if (value == "") {
                          print("kosong");
                          setState(() {
                            ckintstok = false;
                            ckstok = true;
                          });
                        } else {
                          print("oke");
                          setState(() {
                            ckintstok = false;
                            ckstok = false;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    RoundeValueFieldWhiteValue(
                      control: deskripsi,
                      title: "Deskripsi",
                      hover: "masukkan deskripsi....",
                      check: ckdeskripsi,
                      fungsi: (value) {
                        print(value);
                        if (value == "") {
                          setState(() {
                            ckdeskripsi = true;
                          });
                        } else {
                          setState(() {
                            ckdeskripsi = false;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    load.updateDataProduct(
                        produkid,
                        judul.text,
                        int.parse(harga.text),
                        deskripsi.text,
                        int.parse(stok.text));
                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Update Data Successfully',
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                    ));
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Simpan",
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
