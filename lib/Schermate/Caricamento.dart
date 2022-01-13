// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Caricamento extends StatefulWidget {
  @override
  _CaricamentoState createState() => _CaricamentoState();
}

class _CaricamentoState extends State<Caricamento> {

  void initState(){

    //Naviga sulla home page
    Future.delayed(Duration(milliseconds: 500), (){
      Navigator.pushReplacementNamed(context, '/home');
    });

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    //Larghezza schermo
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(

        //Decorazione
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue,
                Colors.red,
              ],
            )
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SALA GIOCHI",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: width / 23,
                  fontWeight: FontWeight.bold
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 20
              ),
              child: Center(
                child: SpinKitRing(
                  color: Colors.white,
                  size: width / 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
