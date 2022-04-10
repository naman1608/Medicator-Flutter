import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/models/manufacturer.dart';
import 'package:funny_papers/screens/dashboards/manufacturer_dashboard.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:funny_papers/screens/auth_screens/login_screen.dart';
import 'package:funny_papers/screens/dashboards/hospital_dashboard.dart';
import 'package:funny_papers/shared/constants.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key, required this.isManufacturer}) : super(key: key);
  bool isManufacturer;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  //late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    //_tabController.dispose();
    super.dispose();
  }

  String email = '';
  String password = '';
  String name = '';
  String address = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: const Color(0xFFFFFFFF),
        title: const Text(
          'MEDICATOR',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      bottomSheet: Container(
        color: Color(0xFFFFFFFF),
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Color(0xFFFFF1E6),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              )),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                'To remain connected with us,',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'please login with your personal info',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginScreen(
                            isManufacturer: widget.isManufacturer))),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(15)),
                  primary: Color(0xFFFFF1E6),
                  minimumSize: Size.zero, // Set this
                  padding: const EdgeInsets.all(0), // and this
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                  child: Text(
                    'Sign In Now',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'RaleWay',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              const Text(
                'use your email to register',
                style: TextStyle(fontSize: 18),
              ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
              //   child: Container(
              //     padding: const EdgeInsets.all(0),
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: Color(0xFFBBBBBB)),
              //     child: TabBar(
              //       indicatorPadding: const EdgeInsets.all(0),
              //       indicator: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         color: Colors.black,
              //       ),
              //       labelColor: Colors.white,
              //       unselectedLabelColor: Colors.black,
              //       controller: _tabController,
              //       tabs: const <Widget>[
              //         LeaderboardTabBar(
              //             paddingConstant: 18, text: 'Manufacturers'),
              //         LeaderboardTabBar(paddingConstant: 18, text: 'Retailers'),
              //       ],
              //     ),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 25,
                  horizontal: 45,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          maxLines: 1,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Email',
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
                              email = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 15,
                            ),
                          ),
                          validator: (val) {
                            if (val!.length < 6) {
                              return 'Enter a longer password';
                            } else {
                              return null;
                            }
                          },
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Name',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 15,
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter a valid name';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              name = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: TextFormField(
                          keyboardType: TextInputType.name,
                          decoration: textInputDecoration.copyWith(
                            hintText: 'Address',
                            hintStyle: const TextStyle(
                              color: Color(0xFF9E9E9E),
                              fontSize: 15,
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Enter a valid address';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (val) {
                            setState(() {
                              address = val;
                            });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: double.infinity,
                        height: 47,
                        child: ElevatedButton(
                          onPressed: () async {
                            print('PRESSED');
                            if (_formKey.currentState!.validate()) {
                              await FirebaseAuth.instance
                                  .createUserWithEmailAndPassword(
                                      email: email, password: password);
                              UserCredential userCredential = await FirebaseAuth
                                  .instance
                                  .signInWithEmailAndPassword(
                                      email: email, password: password);
                              print(userCredential);
                              if (userCredential.user == null) {
                                setState(() {
                                  error = 'Registration Failed';
                                });
                              } else {
                                if (widget.isManufacturer) {
                                  await FirebaseAuth.instance.currentUser!
                                      .updateDisplayName('Manufacturer');
                                  print(FirebaseAuth.instance.currentUser!.uid);
                                  final response = await http.post(
                                      Uri.parse(
                                          "https://063e-2401-4900-415f-78b-4187-47b8-923b-d79e.ngrok.io/backend/saveprofilemanu"),
                                      headers: <String, String>{
                                        'Content-Type':
                                            'application/json; charset=UTF-8',
                                      },
                                      body: jsonEncode(<String, String>{
                                        'uid': FirebaseAuth
                                            .instance.currentUser!.uid,
                                        'email': email,
                                        'name': name,
                                        'address': address,
                                      }));
                                  // print('RESPONSE');
                                  // print(response.statusCode);
                                  // print(response.body);
                                  // print(jsonDecode(response.body));
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ManufacturerDashboard()),
                                      (route) => false);
                                } else {
                                  await FirebaseAuth.instance.currentUser!
                                      .updateDisplayName('Hospital');
                                  print(FirebaseAuth.instance.currentUser!.uid);
                                  final response = await http.post(
                                      Uri.parse(
                                          "https://063e-2401-4900-415f-78b-4187-47b8-923b-d79e.ngrok.io/backend/saveprofilehosp"),
                                      headers: <String, String>{
                                        'Content-Type':
                                            'application/json; charset=UTF-8',
                                      },
                                      body: jsonEncode(<String, String>{
                                        'uid': FirebaseAuth
                                            .instance.currentUser!.uid,
                                        'email': email,
                                        'name': name,
                                        'address': address,
                                      }));
                                  // print('RESPONSE');
                                  // print(response.statusCode);
                                  // print(response.body);
                                  // print(jsonDecode(response.body));
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HospitalDashboard()),
                                      (route) => false);
                                }
                              }
                            }
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(color: Colors.black, width: 1.5),
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// class LeaderboardTabBar extends StatelessWidget {
//   const LeaderboardTabBar({
//     Key? key,
//     required this.paddingConstant,
//     required this.text,
//   }) : super(key: key);

//   final double paddingConstant;
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Tab(
//       height: paddingConstant * 2,
//       child: Text(text,
//           style: const TextStyle(
//             fontSize: 13,
//             fontWeight: FontWeight.w400,
//             letterSpacing: 0.4,
//           ),
//           textAlign: TextAlign.center),
//     );
//   }
// }
