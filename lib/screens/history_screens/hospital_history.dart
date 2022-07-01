import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/models/medicine.dart';
import 'package:funny_papers/shared/constants.dart';
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
      backgroundColor: Color(0xFFFFF1E6),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFFF1E6),
        title: const Text(
          'MEDICATOR',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Scan Product',
              style: TextStyle(color: Colors.black),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => HospitalHistory())),
            child: const Text(
              'History',
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
          future: http.post(Uri.parse(API + "/backend/history"),
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
                print(snapshot.data);
                print(snapshot.data.body);
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
