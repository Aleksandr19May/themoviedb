import 'package:flutter/material.dart';

abstract class AppButtonStyle {
static const ButtonStyle linkButton =  ButtonStyle(
            
            foregroundColor: MaterialStatePropertyAll(Color(0xFF01B4E4)),
            padding:MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 15,vertical: 8)) ,
            textStyle: MaterialStatePropertyAll(TextStyle(
              fontSize: 16,fontWeight: FontWeight.w400
            ),
            
            ) 
          );


}