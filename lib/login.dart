import 'package:demo_app/register.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void loginUser(){
    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
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
              colors: [Colors.white24, const Color.fromARGB(255, 145, 87, 156)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomCenter,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Email",
                      errorText: _isNotValidate ? "Enter fill out" : null,
                      border: OutlineInputBorder(
                        borderRadius: 
                          BorderRadius.all(Radius.circular(10.0))),
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextField(
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Password",
                      errorText: _isNotValidate ? "Please check your password" : null,
                      border: OutlineInputBorder(
                        borderRadius: 
                          BorderRadius.all(Radius.circular(10.0))),
                    ),
                    ),
                  //   SizedBox(height: 10,),
                  //   FilledButton(
                  //     onPressed: () {}, 
                  //     child: Text('Login'),
                  //     style: TextButton.styleFrom(
                  //       primary: Color.fromARGB(255, 84, 7, 140),
                  //     ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      loginUser();
                    },
                    child: HStack([
                      VxBox(
                        child: "Login".text.makeCentered().p16(),
                        ).blue500.roundedLg.make().py16(),

                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Registration(),),);
                    },
                    child: HStack([
                      " Sign up".text.make(),
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