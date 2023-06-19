import 'package:flutter/material.dart';
import 'WelcomePage.dart';

class SettingPage extends StatelessWidget {
  void _updateApp(BuildContext context) {
    // Logic to update the application
    // ...
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Update Aplikasi'),
          content: Text('Aplikasi Sudah Terupdate.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengaturan'),
        backgroundColor: Color.fromARGB(255, 255, 90, 78),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Kebijakan Privasi'),
            onTap: () {
              // Navigasi ke halaman kebijakan privasi
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
              );
            },
          ),
          ListTile(
            title: Text('Tentang Kami'),
            onTap: () {
              // Navigasi ke halaman tentang kami
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsPage()),
              );
            },
          ),
          ListTile(
            title: Text('Pembaruan Aplikasi'),
            onTap: () {
              // Panggil fungsi _updateApp()
              _updateApp(context);
            },
          ),
        ],
      ),
    );
  }

  FlatButton({required Text child, required Null Function() onPressed}) {}
}

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kebijakan Privasi'),
        backgroundColor: Color.fromARGB(255, 255, 90, 78),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Syarat & Ketentuan',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Dengan mengunduh atau menggunakan aplikasi, persyaratan ini akan secara otomatis berlaku untuk Anda – karena itu Anda harus memastikan bahwa Anda membacanya dengan cermat sebelum menggunakan aplikasi. Anda tidak diizinkan untuk menyalin atau memodifikasi aplikasi, bagian apa pun dari aplikasi, atau merek dagang kami dengan cara apa pun. Anda tidak diizinkan mencoba mengekstrak kode sumber aplikasi, dan Anda juga tidak boleh mencoba menerjemahkan aplikasi ke bahasa lain atau membuat versi turunan. Aplikasi itu sendiri, dan semua merek dagang, hak cipta, hak basis data, dan hak kekayaan intelektual lainnya yang terkait dengannya, masih menjadi milik Ngeeeng. Ngeeeng berkomitmen untuk memastikan bahwa aplikasi ini bermanfaat dan seefisien mungkin. Oleh karena itu, kami berhak melakukan perubahan pada aplikasi atau membebankan biaya untuk layanannya, kapan pun dan dengan alasan apa pun. Kami tidak akan pernah menagih Anda untuk aplikasi atau layanannya tanpa memperjelas kepada Anda apa yang Anda bayar. Aplikasi Ngeeeng menyimpan dan memproses data pribadi yang telah Anda berikan kepada kami, untuk menyediakan Layanan kami. Anda bertanggung jawab untuk menjaga keamanan ponsel dan akses ke aplikasi. Karena itu kami menyarankan Anda untuk tidak melakukan jailbreak atau melakukan root pada ponsel Anda, yang merupakan proses menghapus batasan dan batasan perangkat lunak yang diberlakukan oleh sistem operasi resmi perangkat Anda. Ini dapat membuat ponsel Anda rentan terhadap malware/virus/program jahat, membahayakan fitur keamanan ponsel Anda, dan itu dapat berarti bahwa aplikasi Ngeeeng tidak akan berfungsi dengan baik atau tidak berfungsi sama sekali. Aplikasi memang menggunakan layanan pihak ketiga yang menyatakan Syarat dan Ketentuan mereka. Tautan ke Syarat dan Ketentuan penyedia layanan pihak ketiga yang digunakan oleh aplikasi.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
        backgroundColor: Color.fromARGB(255, 255, 90, 78),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tentang Kami',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Ngeeeng adalah perusahaan ojek online yang berkomitmen untuk memberikan layanan transportasi yang cepat, aman, dan nyaman bagi masyarakat. Dengan menggunakan teknologi terkini, kami memungkinkan pengguna untuk dengan mudah memesan ojek melalui aplikasi kami yang user-friendly.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

