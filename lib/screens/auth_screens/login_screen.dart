import 'package:flutter/material.dart';
import 'package:funny_papers/main.dart';
import 'package:funny_papers/screens/auth_screens/register_screen.dart';
import 'package:funny_papers/screens/dashboards/hospital_dashboard.dart';
import 'package:funny_papers/screens/dashboards/manufacturer_dashboard.dart';
import 'package:funny_papers/services/auth.dart';
import 'package:funny_papers/shared/constants.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key, required this.isManufacturer}) : super(key: key);
  bool isManufacturer;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                height: 50,
              ),
              const Text(
                'New Here?',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              const Text(
                'register yourself to get access',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const Text(
                'to our technology',
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
                        builder: (context) => RegisterScreen(
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
                    'Sign Up Now',
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
              'Welcome Back!',
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'RaleWay',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Text(
              'use your email to login',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 30,
            ),
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
                      padding: EdgeInsets.symmetric(vertical: 5),
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: textInputDecoration.copyWith(
                          border: InputBorder.none,
                          hintText: 'Email',
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
                      padding: EdgeInsets.symmetric(vertical: 5),
                      height: 60,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Password',
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 47,
                      child: ElevatedButton(
                        onPressed: () async {
                          print('PRESSED');
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result =
                                await signInCompanyWithEmailandPassword(
                                    email, password);
                            print(result);
                            if (result == null) {
                              setState(() {
                                error = 'sign in failed';
                                loading = false;
                              });
                            } else {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          HospitalDashboard()),
                                  (route) => false);
                            }
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Colors.black, width: 1.5),
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
          ],
        ),
      ),
    );
  }
}
