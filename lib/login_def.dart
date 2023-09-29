import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_logindef/animation/FadeAnimation.dart';
import 'package:flutter_logindef/bienvenido.dart';

class logindef extends StatefulWidget {
  const logindef({super.key});

  @override
  State<logindef> createState() => _logindefState();
}

class _logindefState extends State<logindef> {
  //autenticacoin de firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";

  //validacion de credenciales
  void _handleLogin() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print("Usuario loggeado ${userCredential.user!.email}");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => bienvenido(),
          ));
    } catch (e) {
      print("Error al logearse: $e ");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        //padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color.fromARGB(229, 188, 1, 1), Colors.red])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Image.asset('assets/img/univalle.png'),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                    1,
                    const Text("BIENVENIDO",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'MartianMono')),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                  margin: const EdgeInsets.only(
                    left: 20, // Margen izquierdo
                    // Margen superior
                    right: 20, // Margen derecho
                    bottom: 24, // Margen inferior
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                          ),
                          FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color:
                                              Color.fromRGBO(225, 95, 27, .3),
                                          blurRadius: 20,
                                          offset: Offset(0, 10)),
                                    ]),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Usuario",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Por Favor Introduce Tu Email";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _email = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey))),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                            hintText: "Contraseña",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Por Favor Introduce Tu Contraseña";
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _password = value;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          FadeAnimation(
                            1.5,
                            Container(
                              height: 50,
                              width: 200,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.red),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    _handleLogin();
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FadeAnimation(
                              1.5,
                              const Text(
                                "Olvidaste tu contraseña?",
                                style: TextStyle(color: Colors.grey),
                              )),
                          const SizedBox(
                            height: 40,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
