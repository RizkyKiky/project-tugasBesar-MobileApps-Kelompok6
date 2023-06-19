import 'package:contohflutter/ProfileV2.dart';
import 'package:contohflutter/maps.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PesanForm extends StatefulWidget {
  @override
  _PesanFormState createState() => _PesanFormState();
}

class _PesanFormState extends State<PesanForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name;
  String? _email;
  String? _feedback;

  final _FeedbackController _feedbackController = _FeedbackController();

  void _submitForm() {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Nama: $_name');
      print('Email: $_email');
      print('Saran: $_feedback');

      // Menyimpan data ke Firebase Firestore
      Map<String, dynamic> dataToSave = {
        'name': _name,
        'email': _email,
        'feedback': _feedback,
      };
      FirebaseFirestore.instance
          .collection('pesan')
          .add(dataToSave)
          .then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terima kasih atas saran Anda!'),
          ),
        ).closed.then((_) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
                (route) => false,
          );
        });
      }).catchError((error) {
        print('Error saat menyimpan data: $error');
        // Menampilkan pesan error kepada pengguna
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Terjadi kesalahan. Mohon coba lagi.'),
          ),
        );
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(55, 0, 53, 31),
                    width: double.infinity,
                    height: 46,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFFF6768)),
                      borderRadius: BorderRadius.circular(111),
                    ),
                    child: Center(
                      child: Text(
                        'Kotak Tanggapan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Color(0xFFFF6768),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(2),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Berikan apa saja tanggapanmu tentang aplikasi ini, disini!',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.red,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.fromLTRB(25, 16, 25, 16),
                        width: 500,
                        height: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xffff6768)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: TextEditingController(text: _name),
                              validator: (input) {
                                if (input?.isEmpty ?? true) {
                                  return 'Harap masukkan nama Anda';
                                }
                                return null;
                              },
                              onSaved: (input) => _name = input!,
                              decoration: InputDecoration(
                                labelText: 'Nama',
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: TextEditingController(text: _email),
                              validator: (input) {
                                if (input?.isEmpty ?? true) {
                                  return 'Harap masukkan alamat email Anda';
                                }
                                return null;
                              },
                              onSaved: (input) => _email = input!,
                              decoration: InputDecoration(
                                labelText: 'Email',
                              ),
                            ),
                            SizedBox(height: 16),
                            TextFormField(
                              controller: TextEditingController(text: _feedback),
                              validator: (input) {
                                if (input?.isEmpty ?? true) {
                                  return 'Harap masukkan kritik & saran Anda';
                                }
                                return null;
                              },
                              onSaved: (input) => _feedback = input!,
                              maxLines: 5,
                              decoration: InputDecoration(
                                labelText: 'Kritik & Saran',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: _submitForm,
                            child: Text(
                              'Kirim tanggapanmu',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                height: 1.5,
                                color: Color(0xffffffff),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 103, 104, 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color.fromRGBO(255, 103, 104, 1), width: 2.0),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color.fromRGBO(255, 103, 104, 1),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                iconSize: 30,
                padding: EdgeInsets.all(8),
              ),
            ),
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
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()),
                );
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
              icon: Icon(Icons.place),
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
        onPressed: () {},
        child: Icon(Icons.qr_code_scanner),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _FeedbackController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    feedbackController.dispose();
  }
}
