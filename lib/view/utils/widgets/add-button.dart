import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_management_system/view/utils/constants/font_style.dart';
import '../constants/responsive.dart';

class AddButton extends StatelessWidget {
  AddButton({
    required this.press,
    required this.text,
  });

  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => press(),
      child: Container(
        height: Responsive.isMobile(context) ? 76 : 100,
        width: Responsive.isMobile(context) ? 200 : 360,
        decoration: BoxDecoration(
          color: Colors.white, // ✅ White button background
          border: Border.all(
            width: Responsive.isDesktop(context) ? 3 : 2,
            color: Colors.black, // ✅ Black border
          ),
          borderRadius: BorderRadius.circular(
            Responsive.isDesktop(context)
                ? 20
                : Responsive.isTablet(context)
                ? 16
                : 14,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: redHatBoldStyle(
              color: Colors.black, // ✅ Black text color
              fontSize: Responsive.isDesktop(context)
                  ? 28
                  : Responsive.isTablet(context)
                  ? 24
                  : 20,
            ),
          ),
        ),
      ),
    );
  }

}
