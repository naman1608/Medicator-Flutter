import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:funny_papers/home.dart';
import 'package:funny_papers/screens/dashboards/hospital_dashboard.dart';
import 'package:funny_papers/screens/dashboards/manufacturer_dashboard.dart';
import 'package:funny_papers/shared/loading.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null
          ? Home()
          : (FirebaseAuth.instance.currentUser!.displayName == 'Manufacturer'
              ? ManufacturerDashboard()
              : HospitalDashboard()),
      theme: ThemeData(
        textTheme: TextTheme(
          headline1:
              GoogleFonts.poppins(fontSize: 60, fontWeight: FontWeight.w600),
          headline2: GoogleFonts.poppins(
              fontSize: 50, fontWeight: FontWeight.w600, letterSpacing: -0.5),
        ).apply(
            bodyColor: const Color(0xFF263238),
            displayColor: const Color(0xFF263238)),
      ),
    );
  }
}
