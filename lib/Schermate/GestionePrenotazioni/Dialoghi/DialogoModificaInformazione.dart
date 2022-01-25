// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Altro/Variabili.dart';
import 'package:gestione_salagiochi/Classi/Prenotazione.dart';
void modificaInformazione(BuildContext context, String dato){

  String nuovoDato = "";

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
                    "Modifica " + dato.toLowerCase()
                ),

                content: TextField(
                  onChanged: (String val){
                    nuovoDato = val;
                  },
                ),

                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCELLA",
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: FlatButton(
                      onPressed: (){
                        modificaDato(dato, nuovoDato);
                        Navigator.pop(context);
                      },
                      child: Text(
                        "OK",
                        style: TextStyle(
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

void modificaDato(String nomeDato, String nuovoDato) async {

  final datiDocumentSnap = await FirebaseFirestore.instance
      .collection("dati")
      .doc("prenotazioni")
      .get();

  List<dynamic> prenotazioni = [];
  prenotazioni = datiDocumentSnap.get("giorni");
  int numeroPrenotazioni = datiDocumentSnap.get("prenotazioni");

  String nD = "";

  switch(nomeDato){
    case "Nome":
      nD = "nome";
      break;
    case "Cognome":
      nD = "cognome";
      break;
    case "Indirizzo mail":
      nD = "mail";
      break;
    case "Numero di telefono":
      nD = "telefono";
      break;
    default:
      return;
  }

  print(nD);

  prenotazioni[indicePrenotazione]["${nD}"] = nuovoDato;

  FirebaseFirestore.instance.collection("dati").doc("prenotazioni").set({
    "giorni": prenotazioni,
    "prenotazioni": numeroPrenotazioni,
  });

  print(prenotazioni);

}