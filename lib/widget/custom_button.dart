import 'package:flutter/material.dart';
import 'package:zoom_clone_app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            primary: buttonColor,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          )),
    );
  }
}
