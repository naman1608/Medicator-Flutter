import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/models/medicine.dart';
import 'package:http/http.dart' as http;

class ManufacturerHistory extends StatefulWidget {
  const ManufacturerHistory({Key? key}) : super(key: key);

  @override
  State<ManufacturerHistory> createState() => _ManufacturerHistoryState();
}

class _ManufacturerHistoryState extends State<ManufacturerHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: http.post(
              Uri.parse(
                  "https://063e-2401-4900-415f-78b-4187-47b8-923b-d79e.ngrok.io/backend/history"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                "type": "hospital",
                "uid": FirebaseAuth.instance.currentUser!.uid
              })),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                List<dynamic> historyData = snapshot.data;
                return ListView.builder(
                  itemCount: historyData.length,
                  itemBuilder: ((context, index) {
                    Medicine medicine = Medicine.fromJson(historyData[index]);
                    return Row(
                      children: [
                        Text(medicine.name),
                        Text(medicine.manufacturing),
                      ],
                    );
                  }),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
