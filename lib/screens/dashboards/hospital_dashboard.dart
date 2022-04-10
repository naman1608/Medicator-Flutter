import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/screens/history_screens/hospital_history.dart';
import 'package:http/http.dart' as http;

class HospitalDashboard extends StatefulWidget {
  const HospitalDashboard({Key? key}) : super(key: key);

  @override
  State<HospitalDashboard> createState() => _HospitalDashboardState();
}

class _HospitalDashboardState extends State<HospitalDashboard> {
  late String hospitalName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
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
          Container(
            color: Colors.white,
            child: TextButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HospitalHistory())),
              child: const Text(
                'My History',
                style: TextStyle(color: Colors.black),
              ),
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
      body: FutureBuilder(
        future: http.post(
            Uri.parse(
                "http://5f9b-2405-201-4022-e94c-d95-5757-635-a66d.ngrok.io/backend/getprofilehosp"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "uid": FirebaseAuth.instance.currentUser!.uid
            })),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              dynamic data = jsonDecode(snapshot.data.body);
              hospitalName = data[0]['name'];
              return Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Welcome ' + hospitalName,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Retailer',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              );
            }
          }
          return Container();
        },
      ),
    );
  }
}
