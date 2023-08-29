import 'dart:html';

import 'package:demo_app/login.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 15 , right: 15),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white24, Colors.brown],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              ),
          //color: Colors.white24,
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("CREATE YOUR ACCOUNT" , 
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  SizedBox(
                    height: 10,
                    ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    ),
                  TextField(
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      //   onPressed: () {}, 
                      //   icon: Icon(Icons.copy),
                      //   ),
                      // prefixIcon: IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.password),
                      //   ), 
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                          ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                    ),
                  GestureDetector(
                    onTap: () {},
                    child: HStack([
                      VxBox(
                        child: "Register".text.makeCentered().p16(),
                        ).blue500.roundedLg.make().py16(),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
                    },
                    child: HStack([
                      "Already Registered?".text.make(),
                      " Sign in".text.make(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
