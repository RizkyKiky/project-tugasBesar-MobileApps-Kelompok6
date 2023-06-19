import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  String imageUrl = "";

  Future<void> pickUploadProfilePic() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih Sumber Gambar'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: Text('Kamera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
                SizedBox(height: 16),
                GestureDetector(
                  child: Text('Galeri'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );

    if (source != null) {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 90,
      );

      if (image != null) {
        Reference ref = FirebaseStorage.instance.ref().child("profiles/${FirebaseAuth.instance.currentUser!.uid}/profile_pic.jpg");
        await ref.putFile(File(image.path));

        final String downloadUrl = await ref.getDownloadURL();
        print(downloadUrl);

        setState(() {
          imageUrl = downloadUrl;
        });
      }
    }
  }

  void saveProfile() async {
    // Mendapatkan ID pengguna yang sedang login
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Membuat objek map dengan data profil
    Map<String, dynamic> profileData = {
      'profileImageUrl': imageUrl, // Menambahkan URL gambar profil ke data profil
    };

    // Menyimpan data profil ke Firestore
    FirebaseFirestore.instance.collection('profiles').doc(userId).set(profileData).then((value) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Sukses'),
            content: Text('Profil berhasil disimpan.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context); // Tutup dialog
                  Navigator.pop(context); // Kembali ke halaman sebelumnya
                },
              ),
            ],
          );
        },
      );
    }).catchError((error) {
      print('Error: $error');
      // Menampilkan pesan atau tindakan lain jika terjadi kesalahan saat penyimpanan
    });

    // Mengatur ulang URL gambar profil jika tidak ada gambar yang dipilih
    if (imageUrl.isEmpty) {
      setState(() {
        imageUrl = ""; // Menghapus URL gambar profil sebelumnya
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromARGB(255, 255, 90, 78),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  pickUploadProfilePic();
                },
                child: Center(
                  child: imageUrl.isEmpty
                      ? Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Icon(
                      Icons.person,
                      size: 90,
                      color: Colors.white,
                    ),
                  )
                      : Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        saveProfile();
                      }
                    },
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 90, 78),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Center(
                        child: Text(
                          'Simpan Perubahan',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
