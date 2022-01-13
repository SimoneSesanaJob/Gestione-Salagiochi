// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gestione_salagiochi/Schermate/GestionePrenotazioni/DatiPrenotazione.dart';
import 'Schermate/GestioneGiorniChiusura/GestioneGiorniChiusura.dart';
import 'Schermate/GestionePrenotazioni/GestionePrenotazioni.dart';
import 'Schermate/ModificaDati/ModificaDati.dart';

import 'Schermate/Caricamento.dart';
import 'Schermate/Home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('it')
      ],

        home: Home(),

        routes: {

          '/home':(context) => Home(),
          '/modifica_dati': (context) => ModificaDati(),
          '/dati_prenotazione': (context) => DatiPrenotazione(),
          '/gestione_prenotazioni': (context) => GestionePrenotazioni(),
          '/gestione_giorni_chiusura': (context) => GestioneGiorniChiusura(),

        },

    );
  }
}
