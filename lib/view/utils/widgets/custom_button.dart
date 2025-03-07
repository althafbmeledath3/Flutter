import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final double radius;
  final Function press;
  final String text;
  final Color textColor;
  final Color buttonColor;

  CustomButton({
    required this.press,
    required this.text,
    this.height = 50,
    this.width = 200,
    this.radius = 20,
    this.textColor = Colors.white,
    this.buttonColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => press(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 12.r,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          ),
        ),
      ),
    );
  }
}
