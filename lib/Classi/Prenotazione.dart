// ignore_for_file: file_names, non_constant_identifier_names, prefer_const_constructors
import 'package:flutter/material.dart';

class Prenotazione{

  String nome = "";
  String cognome = "";
  String email = "";
  String numeroTelefono = "";

  String orarioInizio = "";
  String orarioFine = "";


  Prenotazione({
    required this.nome,
    required this.cognome,
    required this.email,
    required this.numeroTelefono,

    required this.orarioInizio,
    required this.orarioFine
  });

}