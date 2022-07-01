import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/screens/create_record.dart';
import 'package:funny_papers/screens/history_screens/manufacturer_history.dart';
import 'package:funny_papers/shared/constants.dart';
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
      backgroundColor: const Color(0xFFFFF1E6),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFF1E6),
        title: const Text(
          'MEDICATOR',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => CreateRecordScreen()))),
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
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: http.post(Uri.parse(API + "/backend/getprofilemanu"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              "uid": FirebaseAuth.instance.currentUser!.uid
            })),
        builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              print(snapshot.data!.body);
              print(snapshot.data!.statusCode);
              print(FirebaseAuth.instance.currentUser!.uid);
              dynamic data = jsonDecode(snapshot.data!.body);
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
