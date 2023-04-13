import 'package:flutter/material.dart';
import 'package:mobileagroapps/model/cuaca_model.dart';
import 'package:mobileagroapps/provider/cuaca_service.dart';
import 'package:provider/provider.dart';



class CuacaPage extends StatefulWidget {
  const CuacaPage({super.key});

  @override
  State<CuacaPage> createState() => _CuacaPageState();
}

class _CuacaPageState extends State<CuacaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context,listen: false).getCuacaAll();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cuaca"),
      ),
      body: Center(
        child: Consumer<CuacaProvider>(builder: (context,cuacaProvider,_)  {
          if(cuacaProvider.cuacadata == null){
            return CircularProgressIndicator();
          }else{
            final cuacaData = cuacaProvider.cuacadata!;
            return Column(
              children: [
                Text("kondisi cuaca"),
                SizedBox(height: 20,),
                Text('main: ${cuacaData.cuacanya.first.main}'),
                TextField(),
              ],
            );
          }
        }),
      ),
    );
  }
}