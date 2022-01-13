// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Classi/Prenotazione.dart';
void infoPrenotazione(BuildContext context, Prenotazione prenotazione){

  String giorno = "01-01-2021";
  String ora_fine = "13:00";
  String ora_inizio = "12:00";

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
                    "Informazioni prenotazione"
                ),

                //Text field
                content: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Column(
                    children: [
                      Text(
                        "Nome: ${prenotazione.nome}"
                      ),
                      Text(
                          "Cognome: ${prenotazione.nome}"
                      ),
                      Text(
                          "Nome: ${prenotazione.nome}"
                      ),
                      Text(
                          "Nome: ${prenotazione.nome}"
                      ),
                      Text(
                          "Nome: ${prenotazione.nome}"
                      ),
                    ],
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