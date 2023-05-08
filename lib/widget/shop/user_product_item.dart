import 'package:flutter/material.dart';
import 'package:mobileagroapps/provider/product_provider.dart';
import 'package:provider/provider.dart';


class UserProductItem extends StatelessWidget {
  final String title;
  final String imageurl;
  final int idx;
  UserProductItem({required this.title,required this.imageurl,required this.idx});

  @override
  Widget build(BuildContext context) {
    var loadproduk = Provider.of<ProductProvider>(context,listen: false);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imageurl),),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.edit),color: Theme.of(context).primaryColor,),
            IconButton(onPressed: (){
              print("hapus idx ke:$idx");
              loadproduk.hapus(idx);
            }, icon: Icon(Icons.delete),color: Theme.of(context).primaryColor,)
          ],
        ),
      ),
    );
  }
}