import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/cuaca_service.dart';

class ForecastCuacaPage extends StatefulWidget {
  const ForecastCuacaPage({super.key});

  @override
  State<ForecastCuacaPage> createState() => _ForecastCuacaPageState();
}

class _ForecastCuacaPageState extends State<ForecastCuacaPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<CuacaProvider>(context, listen: false).getForecastCuaca();
  }

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      child: Consumer<CuacaProvider>(builder: (context,cuacaProvider,_){
        final cuacabesok = cuacaProvider.cuacafrData!;
        return Column(
          children: [
            Text(cuacabesok.first.temp)
          ],
        );
      }
      )
    );
  }
}
