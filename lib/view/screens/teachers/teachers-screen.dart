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
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GetBuilder(
          init: TeachersController(),
          builder: (TeachersController teachersController) {
            return !teachersController.isAdding.value
                ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
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

                    // ✅ Add Button (Fixed Placement)
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2), // Debugging Border
                          ),
                          child: AddButton(
                            press: () {
                              teachersController.activateAddingTeacher();
                            },
                            text: 'Add Teacher +',
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),

                    // ✅ Teachers List
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 500,
                              width: Responsive.isDesktop(context)
                                  ? size.width / 3
                                  : size.width / 2,
                              child: GetBuilder(
                                init: TeachersController(),
                                builder: (TeachersController c) {
                                  return FutureBuilder(
                                    future: c.getMyTeachers(),
                                    builder: (context, AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting) {
                                        return Center(child: Text('Loading...'));
                                      }

                                      return c.myTeachers.isEmpty
                                          ? SizedBox(
                                        height: 500,
                                        child: Center(
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
                                        ),
                                      )
                                          : SizedBox(
                                        height: 500,
                                        width: Responsive.isDesktop(context)
                                            ? size.width / 3
                                            : size.width / 2,
                                        child: ListView.separated(
                                          separatorBuilder: (context, index) =>
                                              SizedBox(height: 32),
                                          itemCount: c.myTeachers.value.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            return TeacherItem(
                                              teacher: c.myTeachers.value[index],
                                              controller: teachersController,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
                : AddTeacherScreen(controller: teachersController);
          }),
    );
  }
}
