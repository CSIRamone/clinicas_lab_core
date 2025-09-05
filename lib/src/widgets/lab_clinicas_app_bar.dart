
import 'package:flutter/material.dart';

class LabClinicasAppBar extends AppBar {
  LabClinicasAppBar({super.key, super.actions}) : super(
    toolbarHeight: 72,
    backgroundColor: Colors.transparent,
    flexibleSpace: Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            offset: Offset(0,1),
            blurRadius: 4,
          )
        ]
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.only(left: 44),
        child: Image.asset('assets/images/logo_horizontal.png')),
    ),
   
  );

}