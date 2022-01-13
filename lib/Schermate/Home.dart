// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {

    //Larghezza schermo
    double larghezza_schermo = MediaQuery.of(context).size.width;

    return Scaffold(

      body: Center(
        child: Container(

          width: MediaQuery.of(context).size.width,

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

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              //Bottone prenotazione parco giochi
              Padding(
                padding: EdgeInsets.only(
                    left: larghezza_schermo / 20,
                    right: larghezza_schermo / 20
                ),
                child: SizedBox(
                  width: larghezza_schermo,
                  height: larghezza_schermo / 4,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/gestione_prenotazioni");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(larghezza_schermo / 15),
                      child: Text(
                        "GESTIONE PRENOTAZIONI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: larghezza_schermo / 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(larghezza_schermo / 23)
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              //Bottone dati parco giochi
              Padding(
                padding: EdgeInsets.only(
                  left: larghezza_schermo / 20,
                  right: larghezza_schermo / 20
                ),
                child: SizedBox(
                  width: larghezza_schermo,
                  height: larghezza_schermo / 4,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/modifica_dati");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(larghezza_schermo / 15),
                      child: Text(
                        "MODIFICA DATI PARCO GIOCHI",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: larghezza_schermo / 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(larghezza_schermo / 23)
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: 30,
              ),

              //Bottone gestione giorni chiusura
              Padding(
                padding: EdgeInsets.only(
                    left: larghezza_schermo / 20,
                    right: larghezza_schermo / 20
                ),
                child: SizedBox(
                  width: larghezza_schermo,
                  height: larghezza_schermo / 4,
                  child: FlatButton(
                    onPressed: (){
                      Navigator.pushNamed(context, "/gestione_giorni_chiusura");
                    },
                    child: Padding(
                      padding: EdgeInsets.all(larghezza_schermo / 15),
                      child: Text(
                        "GESTIONE GIORNI DI CHIUSURA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: larghezza_schermo / 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    color: Colors.white.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(larghezza_schermo / 23)
                    ),
                  ),
                ),
              ),

            ],
          ),

        ),
      ),

    );
  }
}
