import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:school_management_system/view/screens/teachers/teachers-controller.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/widgets/header.dart';
import '../../utils/widgets/inforamation_field.dart';
import '../../utils/widgets/submit_button.dart';
import '../../utils/widgets/cancel_button.dart';

class AddTeacherScreen extends StatelessWidget {
  final TeachersController controller;

  AddTeacherScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Header(
              text: 'Teacher',
              size: size,
              logoutIconActivation: false,
              goBackButtonActivation: true,
              backTo: () {
                controller.deactivateAddingTeacher();
                controller.hideInformation();
                controller.clearForm();

              },
            ),
            SizedBox(height: 20),

            Text(
              'Teacher Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            Responsive(
              mobile: Column(
                children: [
                  TeacherInfo(teacherInfo: controller),
                  TeacherStudyInfo(teacherInfo: controller),
                ],
              ),
              tablet: Row(
                children: [
                  Expanded(child: TeacherInfo(teacherInfo: controller)),
                  Expanded(child: TeacherStudyInfo(teacherInfo: controller)),
                ],
              ),
              desktop: Row(
                children: [
                  Expanded(child: TeacherInfo(teacherInfo: controller)),
                  Expanded(child: TeacherStudyInfo(teacherInfo: controller)),
                ],
              ),
            ),
            SizedBox(height: 20),

            Obx(() => !controller.showInfo.value
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubmitButton(press: controller.addTeacher),
                SizedBox(width: 16),
                CancelButton(press: controller.deactivateAddingTeacher),
              ],
            )
                : !controller.isEditing.value
                ? Center(
              child: SubmitButton(
                text: 'Edit',
                press: controller.enableEditing,
              ),
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SubmitButton(press: controller.addTeacher),
                SizedBox(width: 16),
                CancelButton(press: controller.disableEditing),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

// ---------------- Teacher Information Form ----------------
class TeacherInfo extends StatelessWidget {
  final TeachersController teacherInfo;

  TeacherInfo({required this.teacherInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationField(
          label: 'First Name',
          textController: teacherInfo.firstNameController,
          icon: Icons.person,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'Last Name',
          textController: teacherInfo.lastNameController,
          icon: Icons.person,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'Phone Number',
          textController: teacherInfo.phoneNumberController,
          icon: Icons.phone,
          inputType: TextInputType.number,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'Email',
          textController: teacherInfo.emailController,
          icon: Icons.email,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
      ],
    );
  }
}

// ---------------- Teacher Study Information Form ----------------
class TeacherStudyInfo extends StatelessWidget {
  final TeachersController teacherInfo;

  TeacherStudyInfo({required this.teacherInfo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InformationField(
          label: 'Study',
          textController: teacherInfo.studyController,
          icon: Icons.school,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'Specialization',
          textController: teacherInfo.specializationController,
          icon: Icons.book,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'University',
          textController: teacherInfo.universityController,
          icon: Icons.business,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
        SizedBox(height: 16),
        InformationField(
          label: 'Graduate Year',
          textController: teacherInfo.graduateYearController,
          icon: Icons.calendar_today,
          enableEdit: teacherInfo.showInfo.value ? teacherInfo.isEditing.value : true,
        ),
      ],
    );
  }
}
