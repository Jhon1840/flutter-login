//import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_logindef/database.dart';
import 'package:flutter_logindef/login_def.dart';
import 'package:flutter_logindef/vista.dart';
import 'package:fluttertoast/fluttertoast.dart';

class bienvenido extends StatefulWidget {
  const bienvenido({super.key});

  @override
  State<bienvenido> createState() => _bienvenidoState();
}

class _bienvenidoState extends State<bienvenido> {
  uploadData() async {
    Map<String, dynamic> uploaddata = {
      "First Name": userfirstnamecontroller.text,
      "Last Name": userlastnamecontroller.text,
      "Age": useragecontroller.text,
    };

    await DatabaseMethods().addUserDetails(uploaddata);
    Fluttertoast.showToast(
        msg: "Data Uploaded Successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  TextEditingController userfirstnamecontroller = new TextEditingController();
  TextEditingController userlastnamecontroller = new TextEditingController();
  TextEditingController useragecontroller = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String? _email = _auth.currentUser!.email;
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 100.0),
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Nombre",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500)),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(22)),
          child: TextField(
            controller: userfirstnamecontroller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Nombre',
                hintStyle: TextStyle(color: Colors.black54)),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Carrera",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500)),
        ),
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(22)),
          child: TextField(
            controller: userlastnamecontroller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Carrera',
                hintStyle: TextStyle(color: Colors.black54)),
            style: TextStyle(color: Colors.black),
          ),
        ),
        const SizedBox(height: 20.0),
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text("Deuda",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500)),
        ),
        const SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(22)),
          child: TextField(
            controller: useragecontroller,
            decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Su deuda',
                hintStyle: TextStyle(color: Colors.black54)),
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(height: 90.0),
        GestureDetector(
          onTap: () {
            uploadData();
          },
          child: Center(
            child: Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text("Crear",
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
          ),
        ),
        SizedBox(height: 90.0),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Vista()),
            );
          },
          child: Center(
            child: Container(
              width: 150,
              padding: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                  color: Colors.blue[800],
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text("Ver Estudiantes",
                      style: TextStyle(color: Colors.white, fontSize: 18))),
            ),
          ),
        ),
      ],
    ));
  }
}
