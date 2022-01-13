// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Classi/Prenotazione.dart';
void dialogoEliminaPrenotazione(BuildContext context, int indiceInizio, int indiceFine, String data, int indicePrenotazione){

  showGeneralDialog(barrierColor: Colors.black.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) {
        return Transform.scale(

          scale: a1.value,
          child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                contentPadding: EdgeInsets.all(15),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                title: Text(
                    "Elimina prenotazione"
                ),

                //Text field
                content: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(
                    "Si desidera eliminare la prenotazione?"
                  ),
                ),

                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        "NO",
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FlatButton(
                      onPressed: (){
                        eliminaPrenotazione(indiceInizio, indiceFine, indicePrenotazione, data);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "SI",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {return Text("");}
  );
}

void eliminaPrenotazione(int indiceInizio, int indiceFine, int indicePrenotazione, String data) async {

  final prenotazioniSnap = await FirebaseFirestore.instance
      .collection('prenotazioni')
      .doc(data)
      .get();

  final datiSnap = await FirebaseFirestore.instance
      .collection("dati")
      .doc("prenotazioni")
      .get();

  List<dynamic> prenotazioni = [];
  prenotazioni = datiSnap.get("giorni");

  List<dynamic> nuovoArrOrari = [];
  nuovoArrOrari = prenotazioniSnap.get("orari");

  prenotazioni.removeAt(indicePrenotazione);
  for(int i = indiceInizio; i < indiceFine; i++){
    nuovoArrOrari[i] = false;
  }

  //Aggiornamento documenti
  FirebaseFirestore.instance.collection('prenotazioni').doc(data).update({
    'orari': nuovoArrOrari,
  });

  FirebaseFirestore.instance.collection("dati").doc("prenotazioni").set({
    "giorni": prenotazioni,
    "prenotazioni": datiSnap.get("prenotazioni") - 1
  });

}