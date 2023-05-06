import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:provider/provider.dart';


class DetailProductScreen extends StatelessWidget {
  // const DetailProduct({super.key});
  static const routename = '/product_detail';

  @override
  Widget build(BuildContext context) {
    final produkid = ModalRoute.of(context)?.settings.arguments as String;
    final loadproduk = Provider.of<ProductProvider>(context,listen: false).finbyid(produkid);
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                loadproduk.image,
                fit: BoxFit.cover,
              ),
            ),

            Container(
              margin: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10,),
                  Text("Rp${loadproduk.price.toString()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10,),
                  Text(loadproduk.title),
                  Divider(),
                  SizedBox(height: 10
                  ,),
                  Text("Deskripsi Produk",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  Text(loadproduk.description),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.shop_2_outlined),
                    title: Text("Nama Toko"),
                    subtitle: Text("kota Bekasi"),

                  )
                ],
              ),
            
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){}, child: Text("Beli Langsung",style: TextStyle(color: Colors.green),),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 10,
                  
                      
                ),),
                SizedBox(width: 10,),
                ElevatedButton(onPressed: (){}, child: Text("+ Keranjang"))
              ],
            )
            
            
            ],
          ),
        ),
      ),
    );
  }
}