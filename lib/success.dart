import 'package:contohflutter/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:contohflutter/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SuccessPage(),
    );
  }
}

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/success.png'),
                const SizedBox(height: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat, Kamu Sekarang 'Ngeng!' Member!",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Halo, Sekarang kamu sudah menjadi bagian dari 'Ngeng!'. Yuk nikmati aplikasi dan fitur-fitur yang tersedia. Enjoy :)",
                      style: TextStyle(
                        color: Color.fromARGB(255, 94, 94, 94),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    )),
                const SizedBox(height: 100),
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 255, 60, 60)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashboardScreen()));
                    },
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}