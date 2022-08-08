import 'package:flutter/material.dart';
import 'package:zoom_clone_app/utils/colors.dart';
import 'package:zoom_clone_app/widget/home_metting_button.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex=0;
  onpageChange(int page){
    setState(() {
      selectedindex= page;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,title: Text("Meet & Chat"),centerTitle: true,backgroundColor: backgroundColor,),
      
      
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: footerColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedindex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: onpageChange,
        items: [

        BottomNavigationBarItem(icon: Icon(Icons.comment),label: "Meet & chat"),
         BottomNavigationBarItem(icon: Icon(Icons.lock_clock),label: "Meetings"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "contacts"),
           BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.comment),label: "Meet & chat"),
      ]),
      body: Column(
        
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          HomeMettingButton(onPressed: (){},icon: Icons.add,text: "New Meeting",),
           HomeMettingButton(onPressed: (){},icon: Icons.add_box_rounded,text: "Join Meeting",),
         HomeMettingButton(onPressed: (){},icon: Icons.calendar_today,text: "schedule",),
                 HomeMettingButton(onPressed: (){},icon: Icons.arrow_upward_rounded,text: "share screen",),
        ],),
        Expanded(child: Center(child: Text("Create/Join meetings with just a click",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),))),
      ],),
    );
  }
}