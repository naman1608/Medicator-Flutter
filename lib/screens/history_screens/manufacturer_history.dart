import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
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
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF1E6),
        title: const Text(
          'MEDICATOR',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Create Record',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManufacturerHistory())),
            child: const Text(
              'My History',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () async {
              try {
                await FirebaseAuth.instance.signOut().then((value) =>
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MyApp()),
                        (route) => false));
              } catch (e) {
                print(e.toString());
                return null;
              }
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          future: http.post(
              Uri.parse(
                  "http://5f9b-2405-201-4022-e94c-d95-5757-635-a66d.ngrok.io/backend/history"),
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
