import 'package:contohflutter/PilihanTransportasi.dart';
import 'package:contohflutter/maps.dart';
import 'package:contohflutter/maps2.dart';
import 'package:contohflutter/maps3.dart';
import 'package:contohflutter/maps4.dart';
import 'package:contohflutter/pesan.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'qr_scanner_screen.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:contohflutter/ProfileV2.dart';

class DashboardScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  String? _selectedLocation = 'Jakarta';
  List<String> locations = ['Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta'];
  String _qrCodeResult = '';
  stt.SpeechToText? speech;
  bool isListening = false;
  String recognizedText = '';

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }
  void startListening() async {
    if (speech != null) {
      if (await speech!.initialize()) {
        setState(() {
          isListening = true;
        });
        speech!.listen(
          onResult: (result) {
            setState(() {
              recognizedText = result.recognizedWords;
            });
          },
        );
      }
    }
  }

  void stopListening() {
    if (speech != null) {
      speech!.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 180,
                      left: 30,
                      child: IconButton(
                        icon: const Icon(Icons.location_on, color: Colors.red,),
                        onPressed: () {},
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: DropdownButton(
                        value: _selectedLocation,
                        items: locations
                            .map((location) => DropdownMenuItem(
                          child: Text(location),
                          value: location,
                        ))
                            .toList(),
                        onChanged: (newValue) {
                          setState(() {
                            _selectedLocation = newValue;
                          });
                        },
                        underline: const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.notification_add_sharp, color: Colors.black,),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Cari transportasi yang kamu inginkan',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: isListening ? stopListening : startListening,
                    icon: Icon(isListening ? Icons.stop : Icons.mic_outlined),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: 425,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/images1.jpg'),
                      ),
                    ),
                  ),
                  Container(
                    width: 425,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/images2.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Cari Transportasi Favoritmu!'),
            ),
            const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color.fromRGBO(23, 34, 59, 1),
          ),
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 120,
                        height: 90,
                        child: Container(
                          child: Image.asset('assets/images/bus.png'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bus Trans',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 12,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Hari ini, pukul 08:00 - 23:00',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '45.000,00/halte',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MapSample2()),
                                );
                              },
                              child: Text(
                                'Pesan Sekarang',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(255, 103, 104, 1),
                                padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 120,
                        height: 90,
                        child: Container(
                          child: Image.asset('assets/images/uber.png'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Uber',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 12,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Hari ini, pukul 07:00 - 23:00',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '9.000,00/1.5km',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MapSample3()),
                                );
                              },
                              child: Text(
                                'Pesan Sekarang',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromRGBO(255, 103, 104, 1),
                                padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SizedBox(
                        width: 120,
                        height: 90,
                        child: Container(
                          child: Image.asset('assets/images/ojek.png'),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ojekin',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 12,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Hari ini, pukul 07:00 - 23:00',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.attach_money,
                              size: 12,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Text(
                              '4.000,00/1.5km',
                              style: TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 25,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => MapSample4()),
                                );
                              },
                              child: const Text(
                                'Pesan Sekarang',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor : Color.fromRGBO(255, 103, 104, 1),
                                padding: EdgeInsets.symmetric(horizontal: 55, vertical: 5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )]),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children:
          [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()
                ));
              },
            ),
            IconButton(
              icon: Icon(Icons.chat_bubble),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PesanForm()),
                );
              },
            ),
            IconButton(
              icon: Icon(
                  Icons.place,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapSample()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QRScannerScreen()),
          );

          if (result != null) {
            setState(() {
              _qrCodeResult = result;
            });
          }
        },
        child: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


