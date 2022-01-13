// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Schermate/Shared/AppBar.dart';
class GestioneGiorniChiusura extends StatefulWidget {
  @override
  _GestioneGiorniChiusuraState createState() => _GestioneGiorniChiusuraState();
}

class _GestioneGiorniChiusuraState extends State<GestioneGiorniChiusura> {

  //Lista dei giorni di chiusura
  List<dynamic> giorni_chiusura = [];

  //Riempimento orari chiusura con i dati dal server
  void getOrariChiusura() async {
    final snapshot = await FirebaseFirestore.instance.collection("dati").doc("giorni_chiusura").get();
    final List<dynamic> _giorni_chiusura = await snapshot.get("giorni_chiusura");
    setState(() {
      giorni_chiusura = _giorni_chiusura;
    });

  }


  //Visualizza calendario per l'aggiunta di giorni di chiusura
  void visualizzaCalendario() async {

    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2200),

      locale: const Locale('it', 'IT'),

      //Stile
      helpText: 'SELEZIONE DATA',
      cancelText: 'CANCELLA',
      confirmText: 'OK',

    );

    String data = "${selected!.day}-${selected.month}-${selected.year}";

    if(selected != null && !giorni_chiusura.contains(data)){
      setState(() {
        giorni_chiusura.add(data);
      });
      FirebaseFirestore.instance.collection("dati").doc("giorni_chiusura").set({
        "giorni_chiusura": giorni_chiusura
      });
    }

  }

  void initState(){
    super.initState();
    getOrariChiusura();
  }

  void dispose(){
    super.dispose();
    FirebaseFirestore.instance.collection("dati").doc("giorni_chiusura").set({
      "giorni_chiusura": giorni_chiusura
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      extendBodyBehindAppBar: true,

      //APPBAR
      appBar: DefaultAppBar(context, "GESTIONE GIORNI CHIUSURA"),

      //BODY
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

        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: giorni_chiusura.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 0,
                      color: Colors.white.withOpacity(0.2),
                      child: ListTile(
                        title: Text(
                          giorni_chiusura[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete
                          ),
                          onPressed: (){
                            setState(() {
                              giorni_chiusura.removeAt(index);
                            });
                            FirebaseFirestore.instance.collection("dati").doc("giorni_chiusura").set({
                              "giorni_chiusura": giorni_chiusura
                            });
                          },
                        ),
                      ),
                    );
                  }
              ),
            ),

            //Bottone aggiunta data
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width / 20),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 14,
                child: FlatButton(
                  onPressed: (){
                    visualizzaCalendario();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.width / 20,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "AGGIUNGI DATA CHIUSURA",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  color: Colors.white.withOpacity(0.2),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 23)
                  ),
                ),
              ),
            ),

          ],
        ),

      ),

    );
  }
}
