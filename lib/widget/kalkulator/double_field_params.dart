import 'package:flutter/material.dart';



class DoubleFiledparameter extends StatelessWidget {

  final Function() fungsi;
  final TextEditingController controller;
  final TextEditingController controller2;
  final String finaljudul;
  final String judul;
  final String judul2;
  const DoubleFiledparameter({required this.finaljudul,required this.fungsi,required this.controller,required this.controller2,required this.judul,required this.judul2});

  @override
  Widget build(BuildContext context) {
    return Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(70, 100, 100, 100),
                            offset: const Offset(
                              1.0,
                              5.0,
                            ),
                            blurRadius: 7.0,
                            spreadRadius: 1.0,
                          ), //BoxShadow
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(finaljudul,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.green),),
                          SizedBox(height: 10,),
                          Text(judul),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: controller,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(judul2),
                          SizedBox(height: 10),
                          TextField(
                            controller: controller2,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 15, left: 15),
                            child: SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: fungsi,
                                  child: Text("hitung")),
                            ),
                          ),
                        ],
                      ),
                    );
                  
  }
}