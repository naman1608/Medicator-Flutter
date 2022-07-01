import 'package:flutter/material.dart';

const Color primary = Color(0xFFC6292B);
const Color secondary = Color(0xFF24292B);

String API = "http://def8-2401-4900-415f-78b-bd63-11ee-5d12-a02.ngrok.io";

const textInputDecoration = InputDecoration(
  hintMaxLines: 1,
  hintStyle: TextStyle(color: Colors.black, fontSize: 15),
  labelStyle: TextStyle(color: Colors.black),
  helperStyle: TextStyle(color: Colors.black),
  //contentPadding: EdgeInsets.fromLTRB(0, -1, 0, -1),
  fillColor: Color(0xFFFFFFFF),
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.2,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.2,
    ),
  ),
);
