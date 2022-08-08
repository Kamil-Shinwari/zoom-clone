import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone_app/resources/auth_method.dart';
import 'package:zoom_clone_app/screens/home_screen.dart';
import 'package:zoom_clone_app/screens/login_screen.dart';
import 'package:zoom_clone_app/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        "/login":(context) => LogInScreen(),
        "/home":(context) => HomeScreen(),
      },
      home:StreamBuilder(
      stream: AuthMethods().authchanges,
        builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
        else if(snapshot.hasData){
          return HomeScreen();
        }else{
          return LogInScreen();
        }
      },)
    );
  }
}

