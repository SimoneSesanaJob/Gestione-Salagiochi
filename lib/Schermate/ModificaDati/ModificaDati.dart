// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Schermate/ModificaDati/ModificaPostiLiberi.dart';

import 'ModificaPostiDisponibili.dart';

class ModificaDati extends StatefulWidget {
  @override
  _ModificaDatiState createState() => _ModificaDatiState();
}

class _ModificaDatiState extends State<ModificaDati> {
  @override
  Widget build(BuildContext context) {

    //Larghezza schermo
    double larghezza_schermo = MediaQuery.of(context).size.width;

    return Scaffold(

      extendBodyBehindAppBar: true,

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.2),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),

        title: Text(
          "MODIFICA DATI",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),

        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(
              Icons.arrow_back_ios_sharp
          ),
        ),

      ),

      body: Center(
        child: Container(

          //Decorazione
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.yellow,
                  Colors.red,
                ],
              )
          ),

          child: Center(
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      //Posti liberi
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              modificaPostiLiberi(context);
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "POSTI LIBERI:",
                                      textAlign: TextAlign.center,
                                      style: default_textStyke.copyWith(
                                          fontSize: larghezza_schermo / 20
                                      ),
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection("dati").snapshots(),
                                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                        if(snapshot.hasData){
                                          final data = snapshot.requireData;
                                          return Text(
                                            data.docs[0]["posti_liberi"].toString(),
                                            textAlign: TextAlign.center,
                                            style: default_textStyke.copyWith(
                                                fontSize: larghezza_schermo / 20
                                            ),
                                          );
                                        } else if(snapshot.hasError) {
                                          return Text(
                                            "Errore",
                                            style: default_textStyke.copyWith(
                                              fontSize: larghezza_schermo / 220
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            "Nessun dato",
                                            style: default_textStyke.copyWith(
                                                fontSize: larghezza_schermo / 20
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),

                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              modificaPostiLiberi(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: larghezza_schermo / 20,
                            ),
                          )
                        ],
                      ),


                      //Posti massimi
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              modificaPostiDisponibili(context);
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),

                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Text(
                                      "POSTI TOTALI:",
                                      textAlign: TextAlign.center,
                                      style: default_textStyke.copyWith(
                                          fontSize: larghezza_schermo / 20
                                      ),
                                    ),
                                    StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance.collection("dati").snapshots(),
                                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                                        if(snapshot.hasData){
                                          final data = snapshot.requireData;
                                          return Text(
                                            data.docs[0]["posti_massimi"].toString(),
                                            textAlign: TextAlign.center,
                                            style: default_textStyke.copyWith(
                                                fontSize: larghezza_schermo / 20
                                            ),
                                          );
                                        } else if(snapshot.hasError) {
                                          return Text(
                                            "Errore",
                                            style: default_textStyke.copyWith(
                                                fontSize: larghezza_schermo / 20
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            "Nessun dato",
                                            style: default_textStyke.copyWith(
                                                fontSize: larghezza_schermo / 20
                                            ),
                                          );
                                        }
                                      },
                                    )
                                  ],
                                ),
                              ),

                            ),
                          ),
                          IconButton(
                            onPressed: (){
                              modificaPostiDisponibili(context);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: larghezza_schermo / 20,
                            ),
                          )
                        ],
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),

        ),
      ),

    );
  }
}

TextStyle default_textStyke = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
);
