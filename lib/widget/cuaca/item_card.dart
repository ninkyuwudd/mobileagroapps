import 'package:flutter/material.dart';

class CardSpacer extends StatelessWidget {
  final String title;
  final String data;
  CardSpacer({required this.title,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(title,style: TextStyle(color: Color.fromARGB(255, 51, 51, 51),fontWeight: FontWeight.bold),),
          Spacer(),
          Text(data),
        ],
      ),
    );
  }
}




// how to fetch api and show in the widget , using provider , model , screen file in flutter

// the data ex:
//  {
// "list": [
//         {
//             "dt": 1681441200,
//             "main": {
//                 "temp": 299.35,
//                 "feels_like": 299.35,
//                 "temp_min": 299.35,
//                 "temp_max": 301.24,
//                 "pressure": 1012,
//                 "sea_level": 1012,
//                 "grnd_level": 1001,
//                 "humidity": 86,
//                 "temp_kf": -1.89
//             },
//             "weather": [
//                 {
//                     "id": 500,
//                     "main": "Rain",
//                     "description": "light rain",
//                     "icon": "10d"
//                 }
//             ],
// "dt_txt": "2023-04-14 03:00:00"
// },
// {
// "main": {
//                 "temp": 300.09,
//                 "feels_like": 303.42,
//                 "temp_min": 300.09,
//                 "temp_max": 300.93,
//                 "pressure": 1010,
//                 "sea_level": 1010,
//                 "grnd_level": 999,
//                 "humidity": 87,
//                 "temp_kf": -0.84
//             },
//             "weather": [
//                 {
//                     "id": 501,
//                     "main": "Rain",
//                     "description": "moderate rain",
//                     "icon": "10d"
//                 }
//             ],
// "dt_txt": "2023-04-14 06:00:00"
// }
// ]

// }