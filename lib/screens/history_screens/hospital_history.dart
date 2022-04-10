import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/models/medicine.dart';
import 'package:http/http.dart' as http;

class HospitalHistory extends StatefulWidget {
  const HospitalHistory({Key? key}) : super(key: key);

  @override
  State<HospitalHistory> createState() => _HospitalHistoryState();
}

class _HospitalHistoryState extends State<HospitalHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My History'),
      ),
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
                dynamic data = jsonDecode(snapshot.data.body);
                print(data);
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    Medicine medicine = Medicine.fromJson(data[index]);
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
