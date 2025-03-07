import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:school_management_system/view/bindings/login-binding.dart';
import 'package:school_management_system/view/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:school_management_system/view/utils/constants/constant.dart';
import 'package:school_management_system/view/utils/constants/font_families.dart';
import 'package:school_management_system/view/utils/constants/font_style.dart';
import 'package:get/get.dart';
import 'package:school_management_system/view/screens/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {

    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyB7qNVC0pYZzwghc8ltif9r5YthFohcQng",
        appId: "1:847849099035:web:10077320e65fe05e4b0dbe",
        messagingSenderId: "847849099035",
        projectId: "school-e9969",
        storageBucket: "school-e9969.firebasestorage.app",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    const MyApp(),

    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: (context, child) {
        return GetMaterialApp(  // ✅ Fixed function signature
          title: 'College Application',
          theme: ThemeData(
              fontFamily: RedHatDisplay.light,
              scaffoldBackgroundColor: purple,
              primarySwatch: lightPurpleSwatch,
              inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: white,
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: lightGray, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.r),
                  borderSide: BorderSide(color: lightPurple, width: 3),
                ),
                labelStyle: redHatMediumStyle(color: gray, fontSize: 24),
              )),
          initialRoute: AppPages.login,
          initialBinding: LoginBinding(),
          getPages: AppPages.pages,
          debugShowCheckedModeBanner: false,
          builder: EasyLoading.init(),
        );
      },

    );
  }
}
