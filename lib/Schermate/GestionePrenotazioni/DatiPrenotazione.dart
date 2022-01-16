// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestione_salagiochi/Altro/Variabili.dart';
import 'package:gestione_salagiochi/Schermate/Shared/AppBar.dart';

import 'Dialoghi/DialogoEliminaPrenotazione.dart';

class DatiPrenotazione extends StatefulWidget {
  @override
  _DatiPrenotazioneState createState() => _DatiPrenotazioneState();
}

class _DatiPrenotazioneState extends State<DatiPrenotazione> {

  @override
  Widget build(BuildContext context) {

    double larghezzaSchermo = MediaQuery.of(context).size.width;

    return Scaffold(

      extendBodyBehindAppBar: true,

      //APPBAR
      appBar: DefaultAppBar(context, "DATI PRENOTAZIONE"),

      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance.collection("dati").doc("prenotazioni").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if(snapshot.hasData){
              final data = snapshot.requireData;
              return Center(
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

                  child: ListView(
                    children: [

                      //Nome
                      cardDati("Nome", data["giorni"][indicePrenotazione]["nome"]),

                      //Cognome
                      cardDati("Cognome", data["giorni"][indicePrenotazione]["cognome"]),

                      //Indirizzo mail
                      cardDati("Indirizzo mail", data["giorni"][indicePrenotazione]["mail"]),

                      //Numero di telefono
                      cardDati("Numero di telefono", data["giorni"][indicePrenotazione]["telefono"]),

                      //Orario prenotazione
                      cardDati("Orario prenotazione", ((data["giorni"][indicePrenotazione]["orarioInizio"]) + ":" + (data["giorni"][indicePrenotazione]["orarioFine"]))),

                      //Bottone eliminazione prenotazione
                      Padding(
                        padding: EdgeInsets.fromLTRB(larghezzaSchermo / 8, 10, larghezzaSchermo / 8, 0),
                        child: FlatButton(
                          onPressed: (){
                            dialogoEliminaPrenotazione(context, data["giorni"][indicePrenotazione]["indiceInizio"], data["giorni"][indicePrenotazione]["indiceFine"], data["giorni"][indicePrenotazione]["data"], indicePrenotazione, true);
                          },
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Text(
                              "ELIMINA PRENOTAZIONE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: larghezzaSchermo / 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          color: Colors.white.withOpacity(0.2),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),
                      ),

                    ],
                  ),

                ),
              );
            } else {
              return SpinKitRing(
                color: Colors.orange,
              );
            }
        }
      )

    );
  }
}

/*
  Carta con i dati
*/
Padding cardDati(String titolo, String sottotitolo){
  return Padding(
    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(13)
      ),
      elevation: 0,
      color: Colors.white.withOpacity(0.2),
      child: ListTile(
        title: Text(
          titolo,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: Text(
          sottotitolo,
          style: TextStyle(
            fontSize: 16
          ),
        ),
      ),
    ),
  );
}
