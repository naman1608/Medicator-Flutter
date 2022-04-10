import 'package:flutter/material.dart';

class KnowYourVaccine extends StatefulWidget {
  KnowYourVaccine({Key? key, this.data}) : super(key: key);
  List<dynamic>? data;

  @override
  State<KnowYourVaccine> createState() => _KnowYourVaccineState();
}

class _KnowYourVaccineState extends State<KnowYourVaccine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF1E6),
      appBar: AppBar(
        title: const Text('MEDICATOR'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              'Know your Vaccine',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            Text('ENTER'),
            Text('PRODUCT ID'),
            
          ],
        ),
      ),
    );
  }
}
