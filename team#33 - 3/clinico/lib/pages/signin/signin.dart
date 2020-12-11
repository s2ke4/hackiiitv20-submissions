import 'package:clinico/pages/signin/signinbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(40),
                          bottomRight: const Radius.circular(40),
                        )
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Image.asset('assets/signin.png', height: 300,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Center(
                child: SignButton(name: "Sign In as Paitent "),
              ),
              SizedBox(height: 40,),
              Center(
                child: SignButton(name: "Sign in as Doctor "),
              ),
            ],
          ),
        ),
      ),
    );
  }}