import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/screens/history_screens/manufacturer_history.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ManufacturerDashboard extends StatefulWidget {
  const ManufacturerDashboard({Key? key}) : super(key: key);

  @override
  State<ManufacturerDashboard> createState() => _ManufacturerDashboardState();
}

class _ManufacturerDashboardState extends State<ManufacturerDashboard> {
  late String manufacturerName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('MEDICATOR'),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Create Record'),
          ),
          TextButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ManufacturerHistory())),
            child: Text('My History'),
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
            child: Text('Logout'),
          ),
        ],
      ),
      body: FutureBuilder(
        future: http.post(
            Uri.parse(
                "https://063e-2401-4900-415f-78b-4187-47b8-923b-d79e.ngrok.io/backend/getprofilemanu"),
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
              manufacturerName = data[0]['name'];
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
                      'Welcome ' + manufacturerName,
                      style: const TextStyle(fontSize: 28),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Manufacturer',
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
