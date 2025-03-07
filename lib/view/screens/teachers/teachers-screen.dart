import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:school_management_system/view/screens/teachers/add_teacher_screen.dart';
import 'package:school_management_system/view/screens/teachers/teachers-controller.dart';
import 'package:school_management_system/view/utils/constants/constant.dart';
import 'package:school_management_system/view/utils/constants/font_style.dart';
import 'package:school_management_system/view/utils/widgets/add-button.dart';
import 'package:school_management_system/view/utils/widgets/items/teacher-item.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/widgets/header.dart';

class TeachersScreen extends StatelessWidget {
  final TeachersController teachersController = Get.put(TeachersController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Obx(() {
        return Column(
          children: [
            // Header Section
            Padding(
              padding: EdgeInsets.only(
                top: Responsive.isDesktop(context)
                    ? defaultPadding * 3
                    : Responsive.isTablet(context)
                    ? defaultPadding * 2
                    : defaultPadding,
              ),
              child: Header(
                text: 'Teachers',
                size: size,
              ),
            ),
            SizedBox(height: 30),

            // **Show "Add Teacher" button when not adding**
            if (!teachersController.isAdding.value)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: AddButton(
                  press: () {
                    teachersController.activateAddingTeacher();
                  },
                  text: 'Add Teacher +',
                ),
              ),
            SizedBox(height: 20),

            // **Show either the list or the Add Teacher screen**
            Expanded(
              child: teachersController.isAdding.value
                  ? AddTeacherScreen(controller: teachersController)
                  : Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                child: teachersController.myTeachers.isEmpty
                    ? Center(
                  child: Text(
                    'NO Teachers',
                    style: redHatBoldStyle(
                      color: lightGray,
                      fontSize: Responsive.isDesktop(context)
                          ? 52
                          : Responsive.isTablet(context)
                          ? 40
                          : 32,
                    ),
                  ),
                )
                    : ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(height: 20),
                  itemCount: teachersController.myTeachers.length,
                  itemBuilder: (context, index) {
                    return TeacherItem(
                      teacher:
                      teachersController.myTeachers[index],
                      controller: teachersController,
                    );
                  },
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
