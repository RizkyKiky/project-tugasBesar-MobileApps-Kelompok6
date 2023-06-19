import 'package:contohflutter/dashboard_screen.dart';
import 'package:flutter/material.dart';

class PilihanTransportasi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Pesanan",
            style: TextStyle(color: Color.fromRGBO(255, 103, 104, 1))),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          side: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Image.asset('assets/images/success.png'),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Pesananmu sudah terdaftar!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                "Selanjutnya kamu bisa menunggu bus datang di halte terdekat, lalu scan barcode yang ada di beranda saat masuk ke dalam bus",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()
                      ));
                },
                child: Text(
                  "Kembali ke Beranda",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),

                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(255, 103, 104, 1),
                  onPrimary: Colors.white,
                  minimumSize: Size(175, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
