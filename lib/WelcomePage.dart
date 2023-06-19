import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 350,
              height: 525,
              child: Image.asset(
                'assets/images/welcome_image.png',
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 25),
            Text(
              textAlign: TextAlign.center,
              'Selamat Datang di Aplikasi Ngeng!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 30),
            Text(
              textAlign: TextAlign.center,
              'Ini adalah sebuah platform transportasi online yang akan membantu mobilitas anda.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.withOpacity(1),
              ),
            ),
            SizedBox(height: 30),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(255, 103, 104, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                },
                child: Text(
                  'Start',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
