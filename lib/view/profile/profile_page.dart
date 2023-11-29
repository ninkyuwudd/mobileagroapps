import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/keranjang_controller.dart';
import 'package:mobileagroapps/controller/order_controller.dart';
import 'package:mobileagroapps/controller/pilihfile_controller.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/controller/toko_controller.dart';
import 'package:mobileagroapps/utils/images.dart';
import 'package:mobileagroapps/view/login_page.dart';
import 'package:mobileagroapps/view/profile/daftartoko_view.dart';
import 'package:mobileagroapps/view/profile/premium_view.dart';
import 'package:mobileagroapps/view/shop/listproduk_view.dart';
import 'package:provider/provider.dart';
import '../../controller/user_controller.dart';

class ProfileUserPage extends StatefulWidget {
  final int idx;
  ProfileUserPage({required this.idx});

  @override
  State<ProfileUserPage> createState() => _ProfileUserPageState();
}

class _ProfileUserPageState extends State<ProfileUserPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<UserProvider>(context, listen: false).fethcdatauser();
  }

  @override
  Widget build(BuildContext context) {
    final cartproivder = Provider.of<CartProvider>(context);
    final orderprovider = Provider.of<Orderproivder>(context);
    final pickprovider = Provider.of<PilihUploadfile>(context);
    final pordukprovider = Provider.of<ProductProvider>(context);
    final tokoprovider = Provider.of<TokoController>(context);
    final userprovider = Provider.of<UserProvider>(context);

    try {
      final usrprov = Provider.of<UserProvider>(context, listen: false);
      final akunnya = usrprov.akun;
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Images.bg_profile),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Container(
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Center(
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 40),
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        top: MediaQuery.of(context).size.height / 6,
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: akunnya[widget.idx].gambar == null
                                ? DecorationImage(
                                    image: AssetImage(Images.empty_profile))
                                : DecorationImage(
                                    image: NetworkImage(
                                        akunnya[widget.idx].gambar.toString()),
                                    fit: BoxFit.cover),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: akunnya[widget.idx].status == "premium"
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              akunnya[widget.idx].nama.toString(),
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.workspace_premium_rounded,
                              color: Colors.amber,
                            )
                          ],
                        )
                      : Text(
                          akunnya[widget.idx].nama.toString(),
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                ),

                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 10,
                    ),
                    Text(akunnya[widget.idx].email.toString()),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                // Expanded(child: ProfileData(idx: widget.idx,)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/myprofileedit', arguments: [
                      akunnya[widget.idx].id,
                      akunnya[widget.idx].nama,
                      akunnya[widget.idx].username,
                      akunnya[widget.idx].email,
                      akunnya[widget.idx].gender,
                      akunnya[widget.idx].phone,
                      akunnya[widget.idx].gambar
                    ]);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(
                          width: 20,
                        ),
                        Text("My Profile"),
                        const Spacer(),
                        Image(image: AssetImage(Images.right_row_icon)),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: akunnya[widget.idx].status == "user"
                      ? true
                      : akunnya[widget.idx].status == "premium" &&
                              akunnya[widget.idx].toko == ""
                          ? true
                          : akunnya[widget.idx].status == "premium" &&
                                  akunnya[widget.idx].toko != ""
                              ? false
                              : false,
                  child: GestureDetector(
                    onTap: () {
                      // print(akunnya[widget.idx].id);
                      Navigator.pushNamed(
                        context,
                        DaftarToko.routename,
                        arguments: akunnya[widget.idx].id,
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 25, left: 25, bottom: 10),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Daftar Toko"),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child:
                                Image(image: AssetImage(Images.right_row_icon)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: akunnya[widget.idx].status == "user"
                      ? false
                      : akunnya[widget.idx].status == "admin"
                          ? true
                          : akunnya[widget.idx].status == "premium" &&
                                  akunnya[widget.idx].toko == ""
                              ? false
                              : akunnya[widget.idx].status == "premium" &&
                                      akunnya[widget.idx].toko != ""
                                  ? true
                                  : false,
                  child: Container(
                    margin: EdgeInsets.only(
                        top: 10, right: 25, left: 25, bottom: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.all_inbox),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Daftar Produk"),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ListProdukView.routename,
                                arguments: widget.idx);
                          },
                          child:
                              Image(image: AssetImage(Images.right_row_icon)),
                        ),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible:
                      akunnya[widget.idx].status == "premium" ? false : true,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, DaftarPremium.routename);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 10, right: 25, left: 25, bottom: 10),
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, right: 20, left: 20),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 225, 0),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(Icons.all_inbox),
                          SizedBox(
                            width: 20,
                          ),
                          Text("Daftar Premium"),
                          const Spacer(),
                          Image(image: AssetImage(Images.right_row_icon)),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartproivder.clear();
                    orderprovider.clear();
                    pickprovider.clear();
                    pordukprovider.clear();
                    tokoprovider.clear();
                    userprovider.clear();

                    Navigator.pushReplacementNamed(
                        context, LoginPage.routename);
                    // Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 25, left: 25),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, right: 20, left: 20),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 84, 84),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Sign Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      print(e);
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
