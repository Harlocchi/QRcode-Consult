import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends StatelessWidget {
  final Widget child;

  const CustomTextFieldDecoration({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xff03d4ab1), // Cor quando o TextField não está focado
              width: 4.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(
              color: Color(0xff03d4ab1), // Cor quando o TextField está focado
              width: 4.0,
            ),
          ),
        ),
      ),
      child: child,
    );
  }
}
