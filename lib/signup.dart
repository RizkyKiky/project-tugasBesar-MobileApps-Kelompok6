import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:contohflutter/fadeanimation.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback showLoginScreen;
  const SignUpScreen({Key? key, required this.showLoginScreen})
      : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var aSnackBar = const SnackBar(
    content: Text('The password in not match with confirm password'),
  );

  var bSnackBar = const SnackBar(
    content: Text('The Password & Confirm Password fields must fill!'),
  );

  var cSnackBar = const SnackBar(
    content: Text('The Confirm Password field must fill!'),
  );

  var dSnackBar = const SnackBar(
    content: Text('The Password field must fill!'),
  );

  var eSnackBar = const SnackBar(
    content: Text('The Email & Confirm Password fields must fill!'),
  );

  var fSnackBar = const SnackBar(
    content: Text('The Email field must fill!'),
  );

  var gSnackBar = const SnackBar(
    content: Text('The Email & Password fields must fill!'),
  );

  var xSnackBar = const SnackBar(
    content: Text('You must fill all fields'),
  );

  Future signUp() async {
    if (_emailController.text.isNotEmpty &
    _passwordController.text.isNotEmpty &
    _confirmPasswordController.text.isNotEmpty) {
      if (passwordConfirmed()) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(aSnackBar);
      }

    } else if (_emailController.text.isNotEmpty &
    _passwordController.text.isEmpty &
    _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(bSnackBar);
    }

    else if (_emailController.text.isNotEmpty &
    _passwordController.text.isNotEmpty &
    _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(cSnackBar);
    }

    else if (_emailController.text.isNotEmpty &
    _passwordController.text.isEmpty &
    _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(dSnackBar);
    }

    else if (_emailController.text.isEmpty &
    _passwordController.text.isNotEmpty &
    _confirmPasswordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(eSnackBar);
    }

    else if (_emailController.text.isEmpty &
    _passwordController.text.isNotEmpty &
    _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(fSnackBar);
    }

    else if (_emailController.text.isEmpty &
    _passwordController.text.isEmpty &
    _confirmPasswordController.text.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(gSnackBar);
    }

    else {
      ScaffoldMessenger.of(context).showSnackBar(xSnackBar);
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(17),
          width: w,
          height: h,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeAnimation(
                  delay: 1,
                  child: Container(
                    margin: const EdgeInsets.only(),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Flutter.png")),
                    ),
                    height: h / 4,
                    width: w / 1.5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                FadeAnimation(
                  delay: 1.5,
                  child: const Text(
                    "Sign Up To the App",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                FadeAnimation(
                  delay: 2.0,
                  child: TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Email',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                FadeAnimation(
                  delay: 2.5,
                  child: TextField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),

                FadeAnimation(
                  delay: 3,
                  child: TextField(
                    obscureText: true,
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                FadeAnimation(
                  delay: 3.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 90, 78),
                        minimumSize: Size(w / 1.1, h / 15)),
                    onPressed: signUp,
                    child: const Text("Sign Up"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                GestureDetector(
                  onTap: widget.showLoginScreen,
                  child: FadeAnimation(
                    delay: 4,
                    child: RichText(
                      text: TextSpan(
                          text: "Have an account?",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(
                                text: " Log in",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor))
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}