import 'package:flutter/material.dart';
import 'package:funny_papers/screens/qr_scan.dart';
import 'package:funny_papers/shared/constants.dart';

class KnowYourVaccine extends StatefulWidget {
  KnowYourVaccine({Key? key, this.data}) : super(key: key);
  List<dynamic>? data;

  @override
  State<KnowYourVaccine> createState() => _KnowYourVaccineState();
}

class _KnowYourVaccineState extends State<KnowYourVaccine> {
  String? productId;
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      data = widget.data!;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(data.runtimeType);
    return Scaffold(
      backgroundColor: Color(0xFFFFF1E6),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFFFFF1E6),
        title: const Text(
          'MEDICATOR',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xFFFFF1E6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  )),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Know your Product',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 27),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Enter Product ID',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  // const Text(
                  //   'Product ID',
                  //   style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Color(0xFFFFF1E6),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    padding: const EdgeInsets.all(5),
                    height: 60,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: textInputDecoration.copyWith(
                        hintText: 'Product Id',
                        fillColor: Color(0xFFFFF1E6),
                      ),
                      obscureText: true,
                      onChanged: (val) {
                        setState(() {
                          productId = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () async {},
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Check',
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
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Colors.black,
                    thickness: 0.5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    width: double.infinity,
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRScan()),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Scan QR Code',
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
                          side:
                              const BorderSide(color: Colors.black, width: 1.5),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFFF1E6),
                    ),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    padding: EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(
                        data[index]['name'],
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              data[index]['role'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Text(data[index]['date']),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
