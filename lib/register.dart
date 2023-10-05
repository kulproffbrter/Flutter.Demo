import 'dart:convert';

import 'package:demo_app/login.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  Future<void> registerUser() async {
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
      var reqBody = {
        "email" : emailController.text,
        "password" : passwordController.text
      };

      var response = await http.post(
        Uri.parse('http://172.24.153.83:3000/register'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody));
      var jsonResponse = jsonDecode(response.body);
      if(jsonResponse['status']) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),),);
      } else {
        print('Something went wrong!');
      }
    }
    else{
      setState(() {
        _isNotValidate = true;
      });
    }
  }

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
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      errorText: _isNotValidate ? "Enter fill out" : null,
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
                    controller: passwordController,
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
                      errorText: _isNotValidate ? "Please check your password" : null,
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
                    onTap: () {
                      registerUser();
                    },
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
