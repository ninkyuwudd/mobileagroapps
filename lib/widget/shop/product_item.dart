import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/product_model.dart';
import 'package:mobileagroapps/model/produkmodel.dart';
import 'package:mobileagroapps/controller/product_controller.dart';
import 'package:mobileagroapps/screen/shop/detail_product.dart';
import 'package:provider/provider.dart';

class ProductItemsCard extends StatelessWidget {
  final String namaproduk;
  final String urlgambar;
  final String id;

  ProductItemsCard({required this.namaproduk,required this.urlgambar,required this.id});

  @override
  Widget build(BuildContext context) {
    // final product = Provider.of<ProductProvider>(context,listen: false);
    // product.fetchdataproduct();
    // var prdkdata = product.items;
    try{
      return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print(id);
            Navigator.of(context).pushNamed(
              DetailProductScreen.routename,
              arguments: id,
            );
          },
          child: Image.network(
            urlgambar,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // leading: Consumer<Product>(
          //   builder: (ctx, product, _) => IconButton(
          //         icon: Icon(
          //           product.isFavorite ? Icons.favorite : Icons.favorite_border,
          //         ),
          //         color: Theme.of(context).accentColor,
          //         onPressed: () {
          //           product.toggleFavoriteStatus();
          //         },
          //       ),
          // ),
          title: Text(
            namaproduk,
            textAlign: TextAlign.center,
          ),

        ),
      ),
    );
    }catch(e){
      return Center(child: CircularProgressIndicator(),);
    }
    
  }
}