import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:school_management_system/view/routes/app_pages.dart';
import 'package:school_management_system/view/screens/login/login_controller.dart';
import 'package:school_management_system/view/utils/widgets/custom_button.dart';
import 'package:school_management_system/view/utils/widgets/custom_formfield.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade600, Colors.blue.shade300],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'College Application',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Enjoy Managing Your College',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 50.h),

                    // Email Input
                    customFormField(
                      controller: controller.emailController,
                      label: 'Email',
                      prefix: Icons.email,
                      type: TextInputType.emailAddress,
                      onSubmit: (value) {
                        // handle onSubmit
                      },
                      onChange: (value) {
                        // handle onChange
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      height: 130.h, // Set custom height
                      width: size.width * 0.45, // Set custom width
                    ),
                    SizedBox(height: 20.h),

                    // Password Input
                    customFormField(
                      controller: controller.passwordController,
                      label: 'Password',
                      prefix: Icons.lock,
                      isPassword: controller.isPassword.value,
                      suffix: controller.isPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      suffixPressed: controller.showPassword,
                      type: TextInputType.visiblePassword,
                      onSubmit: (value) {
                        // handle onSubmit
                      },
                      onChange: (value) {
                        // handle onChange
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                      height: 130.h, // Set custom height
                      width: size.width * 0.45, // Set custom width
                    ),
                    SizedBox(height: 10.h),

                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.white, fontSize: 14.sp),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),

                    // Login Button
                    CustomButton(
                      press: () => Get.toNamed(AppPages.mainScreen),
                      height: 130.h,
                      width: size.width * 0.45,
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                      radius: 12.r,
                      text: 'Login',
                    ),
                    SizedBox(height: 20.h),

                    // Contact Us Button
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Contact Us',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
