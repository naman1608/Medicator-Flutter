import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/screens/history_screens/manufacturer_history.dart';
import 'package:funny_papers/shared/constants.dart';

class CreateRecordScreen extends StatefulWidget {
  const CreateRecordScreen({Key? key}) : super(key: key);

  @override
  State<CreateRecordScreen> createState() => _CreateRecordScreenState();
}

class _CreateRecordScreenState extends State<CreateRecordScreen> {
  final _formKey = GlobalKey<FormState>();

  String vaccineName = "";
  String mfc = "";
  String exp = "";
  String mrp = "";
  String privateKey = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1E6),
      appBar: AppBar(
        elevation: 0,
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
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Container(
                color: Color(0xFFFFF1E6),
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Vaccine Name',
                    hintStyle: const TextStyle(
                      color: Color(0xFF9E9E9E),
                      fontSize: 15,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter an email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      vaccineName = val;
                    });
                  },
                ),
              ),
              Container(
                color: Color(0xFFFFF1E6),
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: textInputDecoration.copyWith(
                    fillColor: Color(0xFFFFF1E6),
                    hintText: 'Manufacturing Date',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter an email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      mfc = val;
                    });
                  },
                ),
              ),
              Container(
                color: Color(0xFFFFF1E6),
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: textInputDecoration.copyWith(
                    fillColor: Color(0xFFFFF1E6),
                    hintText: 'Expiry Date',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter an email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      exp = val;
                    });
                  },
                ),
              ),
              Container(
                color: Color(0xFFFFF1E6),
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: textInputDecoration.copyWith(
                    fillColor: Color(0xFFFFF1E6),
                    hintText: 'MRP',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter an email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      mrp = val;
                    });
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                height: 60,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  maxLines: 1,
                  decoration: textInputDecoration.copyWith(
                    fillColor: Color(0xFFFFF1E6),
                    hintText: 'Private Key',
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter an email';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() {
                      privateKey = val;
                    });
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 47,
                child: ElevatedButton(
                  onPressed: () async {
                    print('PRESSED');
                    if (_formKey.currentState!.validate()) {
                      final response =
                          await http.post(Uri.parse(API + "/backend/vaccreate"),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'name': vaccineName,
                                'mrp': mrp,
                                'date': mfc,
                                'expiry': exp,
                                'private_key': privateKey,
                                'uid': FirebaseAuth.instance.currentUser!.uid,
                              }));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Added a medicine record!"),
                        behavior: SnackBarBehavior.floating,
                      ));
                      setState(() {
                        vaccineName = '';
                        mfc = '';
                        mrp = '';
                        exp = '';
                        privateKey = '';
                      });
                      // print('RESPONSE');
                      // print(response.statusCode);
                      // print(response.body);
                      // print(jsonDecode(response.body));
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      'Create Record',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.black, width: 1.5),
                    )),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
