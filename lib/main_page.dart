import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//
import 'package:contohflutter/auth_page.dart';
import 'package:contohflutter/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DashboardScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}