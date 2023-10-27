import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_logindef/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Vista extends StatefulWidget {
  const Vista({super.key});

  @override
  State<Vista> createState() => _VistaState();
}

class _VistaState extends State<Vista> {
  String? firstname, lastname, deuda, id;

  TextEditingController textcontroller = new TextEditingController();

  searchUser(String name) async {
    QuerySnapshot querySnapshot = await DatabaseMethods().getthisUserInfo(name);

    id = querySnapshot.docs[0].id;

    firstname = "${querySnapshot.docs[0]["First Name"]}";
    lastname = "${querySnapshot.docs[0]["Last Name"]}";
    deuda = "${querySnapshot.docs[0]["Age"]}";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                "Escribe el primer nombre",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 20.0),
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(22)),
              child: TextField(
                controller: textcontroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter First Name',
                    hintStyle: TextStyle(color: Colors.black54)),
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            GestureDetector(
              onTap: () {
                searchUser(textcontroller.text);
              },
              child: Center(
                child: Container(
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                      color: Colors.blue[800],
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "buscar",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                await searchUser(textcontroller.text);
                await DatabaseMethods().DeleteUserData(id!);
                Fluttertoast.showToast(
                    msg: "User Data Deleted Successfully!!!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              },
              child: Center(
                  child: Container(
                      width: 150,
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.red[800],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: Text("eliminar",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18))))),
            ),
            SizedBox(
              height: 90.0,
            ),
            firstname == null
                ? Container()
                : Center(
                    child: Text(
                      "First Name :  " + firstname!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(
              height: 10.0,
            ),
            lastname == null
                ? Container()
                : Center(
                    child: Text(
                      "Last Name :  " + lastname!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
            SizedBox(
              height: 10.0,
            ),
            deuda == null
                ? Container()
                : Center(
                    child: Text(
                      "deuda :  " + deuda!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
