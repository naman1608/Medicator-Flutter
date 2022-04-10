import 'package:flutter/material.dart';
import 'package:funny_papers/screens/auth_screens/login_screen.dart';
import 'package:funny_papers/screens/auth_screens/register_screen.dart';
import 'package:funny_papers/screens/know_your_vaccine.dart';
import 'package:funny_papers/screens/qr_scan.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1E6),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Color(0xFFFFF1E6),
      //   actions: [
      //     TextButton(
      //       style: ButtonStyle(
      //         padding: MaterialStateProperty.all(EdgeInsets.zero),
      //       ),
      //       onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const HospitalLoginScreen())),
      //       child: const Text(
      //         'Manufacturer',
      //         style: TextStyle(color: Colors.black),
      //       ),
      //     ),
      //     TextButton(
      //       style: ButtonStyle(
      //         padding: MaterialStateProperty.all(EdgeInsets.zero),
      //       ),
      //       onPressed: () => Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //               builder: (context) => const ManufacturerLoginScreen())),
      //       child: const Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Text(
      //           'Retailer',
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Container(
        margin: const EdgeInsets.only(right: 10, top: 0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Image(
                fit: BoxFit.fitWidth,
                width: 350,
                image: AssetImage("lib/assets/funny_papers_bg.png"),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen(isManufacturer: true))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      primary: Colors.black,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.all(0), // and this
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: Text('Manufacturer'),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                LoginScreen(isManufacturer: false))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      primary: Colors.black,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.all(0), // and this
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                      child: Text('Retailer'),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'MEDICATOR',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 50,
                        fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'BLOCKCHAIN BASED PHARMACEUTICALS',
                    style: TextStyle(color: Colors.black),
                  ),
                  const Text(
                    'TRACKING APPLICATION',
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'To know more,',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
                  ),
                  const Text(
                    'click below:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => KnowYourVaccine())),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      primary: Colors.black,
                      minimumSize: Size.zero, // Set this
                      padding: EdgeInsets.all(0), // and this
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Text(
                        'Know your product',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
