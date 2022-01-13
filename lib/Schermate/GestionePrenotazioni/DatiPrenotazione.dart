// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gestione_salagiochi/Schermate/Shared/AppBar.dart';

class DatiPrenotazione extends StatefulWidget {
  @override
  _DatiPrenotazioneState createState() => _DatiPrenotazioneState();
}

class _DatiPrenotazioneState extends State<DatiPrenotazione> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //APPBAR
      appBar: DefaultAppBar(context, "DATI PRENOTAZIONE"),

      

    );
  }
}
