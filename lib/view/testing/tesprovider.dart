import 'package:flutter/material.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:provider/provider.dart';



class Testproductdata extends StatefulWidget {
  const Testproductdata({super.key});

  @override
  State<Testproductdata> createState() => _TestproductdataState();
}

class _TestproductdataState extends State<Testproductdata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProductProvider>(context,listen: false).fetchdataproduct();
  }
  @override
  Widget build(BuildContext context) {
    final productdata = Provider.of<ProductProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("test"),),
      body: Container(
        child: ListView.builder(
          itemCount: productdata.items.length,
          itemBuilder: (ctx,idx){
            final produkidx = productdata.items[idx];
            return ListTile(
              title: Text(produkidx.namaproduk),
              subtitle: Text(produkidx.deskripsi),
            );
          }),
      ),
    );

  }
}