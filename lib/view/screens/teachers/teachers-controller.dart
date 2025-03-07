import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management_system/view/screens/teachers/teachers_api.dart';
import '../../../models/teacher.dart';

class TeachersController extends GetxController {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var studyController = TextEditingController();
  var specializationController = TextEditingController();
  var universityController = TextEditingController();
  var graduateYearController = TextEditingController();
  var additionalInfoController = TextEditingController();
  var teacherGradesController = TextEditingController()
    ..text = 'Grade1, Grade2, Grade3, Grade4, Grade5';

  Teacher? teacherInfo;
  var isEditing = false.obs;
  var isAdding = false.obs;
  var isDeleting = false.obs;
  var showInfo = false.obs;

  List<String> subjectsOptions = ['1', '2', '3'];
  var selectedSubjectsOptionList = [''].obs;
  var selectedSubjectsOption = ''.obs;

  var myTeachers = [].obs; // ✅ Corrected variable name

  @override
  void onInit() {
    super.onInit();
    getMyTeachers();
  }

  addTeacher() async {
    print('Adding teacher...');
    EasyLoading.show(status: 'loading...', dismissOnTap: true);

    bool success = await TeachersApi.addingTeacher(
      firstNameController.text,
      lastNameController.text,
      emailController.text,
      phoneNumberController.text,
      studyController.text,
      specializationController.text,
      universityController.text,
      graduateYearController.text,
      additionalInfoController.text,
    );

    if (success) {
      print('Done!');
      EasyLoading.showSuccess('Teacher added successfully!');

      await getMyTeachers(); // ✅ Fetch updated teacher list
      stopUploadingInfo(); // ✅ Clear input fields after adding
      deactivateAddingTeacher(); // ✅ Hide add teacher form
      update(); // ✅ Refresh UI
    } else {
      EasyLoading.showError('Failed to add teacher!');
    }
  }


  getMyTeachers() async {
    print('Getting teachers...');
    var teachers = await TeachersApi.getTeachers();
    myTeachers.assignAll(teachers); // ✅ Correct way to update an observable list
    update(); // ✅ Refresh UI
    print('Done!');
  }



  void uploadTeacher(Teacher teacher) {
    teacherInfo = teacher;
  }

  void uploadTeacherInformation() {
    if (teacherInfo != null) {
      firstNameController.text = teacherInfo!.firstName ?? '';
      lastNameController.text = teacherInfo!.lastName ?? '';
      emailController.text = teacherInfo!.email ?? '';
      phoneNumberController.text = teacherInfo!.phoneNumber?.toString() ?? '';
      studyController.text = teacherInfo!.study ?? '';
      specializationController.text = teacherInfo!.specialization ?? '';

      universityController.text = teacherInfo!.university ?? '';
      graduateYearController.text = teacherInfo!.graduateYear ?? '';
      additionalInfoController.text = teacherInfo!.additional ?? '';
      teacherGradesController.text = teacherInfo!.grades?.join(', ') ?? '';
    }
  }

  void stopUploadingInfo() {
    firstNameController.clear();
    lastNameController.clear();
    emailController.clear();
    phoneNumberController.clear();
    studyController.clear();
    specializationController.clear();
    universityController.clear();
    graduateYearController.clear();
    additionalInfoController.clear();
    teacherGradesController.clear();
  }

  void startDeleting() {
    isDeleting.value = true;
    update();
  }

  void stopDeleting() {
    isDeleting.value = false;
    update();
  }

  void activateAddingTeacher() { // ✅ Corrected method name
    isAdding.value = true;
    update();
  }

  void deactivateAddingTeacher() { // ✅ Corrected method name
    isAdding.value = false;
    update();
  }

  void enableEditing() {
    isEditing.value = true;
    update();
  }

  void disableEditing() {
    isEditing.value = false;
    update();
  }

  void showInformation() {
    showInfo.value = true;
  }

  void hideInformation() { // ✅ Corrected method name
    showInfo.value = false;
  }

  var selectedSubject = "Subject".obs;
  final selectSubjectOptions = ['1', '2', '3'];

  void setSelectedSubject(value) {
    selectedSubject.value = value;
    update();
  }
}
