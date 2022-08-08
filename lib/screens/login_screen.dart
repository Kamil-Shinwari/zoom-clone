import 'package:flutter/material.dart';
import 'package:zoom_clone_app/resources/auth_method.dart';
import 'package:zoom_clone_app/widget/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final AuthMethods _authMethods=AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Start or Join a Meeting",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:38.0),
              child: Image.asset("assets/onboarding.jpg"),
            ),
            CustomButton(text: "Google Sign In",onPressed: ()async{
              bool res= await _authMethods.SignInWithGoogle(context);
              if(res){
                Navigator.pushNamed(context, "/home");
              }
            },),
          ]),
        ),
      ),
    );
  }
}
