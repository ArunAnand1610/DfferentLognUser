import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterloginapplication/fadeanimation.dart';
import 'package:flutterloginapplication/homepage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var username = TextEditingController();
  var password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Here comes");
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Homepages()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                // Colors.purple,
                Colors.purple.shade600,
                Colors.deepPurpleAccent,
              ])),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: FadeAnimation(
                    2,
                    Text("Hi User.....",
                        style: GoogleFonts.rubik(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  )),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    margin: const EdgeInsets.only(top: 60),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              // color: Colors.red,
                              alignment: Alignment.topLeft,
                              margin:
                                  const EdgeInsets.only(left: 22, bottom: 20),
                              child: FadeAnimation(
                                2,
                                Text("Login",
                                    style: GoogleFonts.rubik(
                                      fontSize: 35,
                                      color: Colors.black87,
                                      letterSpacing: 2,
                                    )),
                              )),
                          FadeAnimation(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.purpleAccent, width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.purpleAccent,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.person),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: username,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text(" User Name ..."),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            2,
                            Container(
                                width: double.infinity,
                                height: 70,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.purpleAccent, width: 1),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.purpleAccent,
                                          blurRadius: 10,
                                          offset: Offset(1, 1)),
                                    ],
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.lock),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(left: 10),
                                        child: TextFormField(
                                          controller: password,
                                          maxLines: 1,
                                          decoration: const InputDecoration(
                                            label: Text(" Password..."),
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            2,
                            ElevatedButton(
                              onPressed: () {
                                signInWithEmail(username.text, password.text);
                              },
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.purpleAccent,
                                  shadowColor: Colors.purpleAccent,
                                  elevation: 18,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Ink(
                                decoration: BoxDecoration(
                                    gradient: const LinearGradient(colors: [
                                      Colors.purpleAccent,
                                      Colors.deepPurpleAccent
                                    ]),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Container(
                                  width: 200,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: Text('Login',
                                      style: GoogleFonts.rubik(
                                        fontSize: 30,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
