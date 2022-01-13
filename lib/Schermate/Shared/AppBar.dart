// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

AppBar DefaultAppBar(BuildContext context, String titolo){
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.white.withOpacity(0.2),

    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
    ),

    title: Text(
      titolo,
      style: TextStyle(
          fontWeight: FontWeight.bold
      ),
    ),

    leading: IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(
          Icons.arrow_back_ios_sharp
      ),
    ),

  );
}