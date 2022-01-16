// ignore_for_file: file_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gestione_salagiochi/Altro/Variabili.dart';
import 'package:gestione_salagiochi/Classi/Prenotazione.dart';
import 'package:gestione_salagiochi/Schermate/GestionePrenotazioni/Dialoghi/DialogoEliminaPrenotazione.dart';
import 'package:gestione_salagiochi/Schermate/Shared/AppBar.dart';

import 'Dialoghi/DialogoInformazioniPrenotazione.dart';

class GestionePrenotazioni extends StatefulWidget {
  @override
  _GestionePrenotazioniState createState() => _GestionePrenotazioniState();
}

class _GestionePrenotazioniState extends State<GestionePrenotazioni> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,

      appBar: DefaultAppBar(context, "Gestione prenotazioni"),

      body: Container(


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

        //Prenotazioni
        child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Center(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance.collection("dati").doc("prenotazioni").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
                  if(snapshot.hasData){
                    final data = snapshot.requireData;
                    return ListView.builder(
                        itemCount: data["prenotazioni"],
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                indicePrenotazione = index;
                              });
                              Navigator.pushNamed(context, "/dati_prenotazione");
                            },
                            child: Card(
                              elevation: 0,
                              color: Colors.white.withOpacity(0.3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: ListTile(
                                title: Text(
                                  "${data["giorni"][index]["data"]}  ${data["giorni"][index]["cognome"]} ${data["giorni"][index]["nome"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                subtitle: Text(
                                  "${data["giorni"][index]["orarioInizio"]} - ${data["giorni"][index]["orarioFine"]}",
                                  style: TextStyle(
                                    fontSize: 12
                                  ),
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red
                                  ),
                                  onPressed: (){
                                    dialogoEliminaPrenotazione(context, data["giorni"][index]["indiceInizio"], data["giorni"][index]["indiceFine"], data["giorni"][index]["data"], index, false);
                                  },
                                ),
                              ),
                            ),
                          );
                        }
                    );
                  } else if(snapshot.hasError) {
                    return Text("Error");
                  } else {
                    return SpinKitRing(
                      color: Colors.orange,
                    );
                  }
                },
              ),
            ),
          )

      ),

    );
  }
}
