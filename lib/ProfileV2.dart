import 'package:contohflutter/PaymentPage.dart';
import 'package:contohflutter/Setting.dart';
import 'package:contohflutter/auth_page.dart';
import 'package:contohflutter/dashboard_screen.dart';
import 'package:contohflutter/main_page.dart';
import 'package:contohflutter/maps.dart';
import 'package:contohflutter/pesan.dart';
import 'package:contohflutter/profileEdit.dart';
import 'package:contohflutter/qr_scanner_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:ui';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imageUrl = "";

  @override
  void initState() {
    super.initState();
    _getImageUrl();
  }

  void _getImageUrl() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      Reference ref =
      FirebaseStorage.instance.ref().child("profiles/$userId/profile_pic.jpg");

      String downloadUrl = await ref.getDownloadURL();

      setState(() {
        imageUrl = downloadUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _qrCodeResult = "";

    User? currentUser = FirebaseAuth.instance.currentUser;
    String userEmail = currentUser?.email ?? "";

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Color.fromARGB(255, 255, 90, 78),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: imageUrl.isEmpty
                      ? CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.red,
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  )
                      : CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  userEmail,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Edit Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfilePage()),
              ).then((_) {
                _getImageUrl(); // Refresh the profile picture after editing
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Payment'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PaymentScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardScreen()));
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
                // Do nothing since we're already on the ProfileScreen
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
