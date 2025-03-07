import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:school_management_system/view/screens/teachers/teachers_api.dart';
import '../../../models/teacher.dart';

class TeachersController extends GetxController {
  // Controllers for form fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final studyController = TextEditingController();
  final specializationController = TextEditingController();
  final universityController = TextEditingController();
  final graduateYearController = TextEditingController();
  final additionalInfoController = TextEditingController();
  final teacherGradesController = TextEditingController()
    ..text = 'Grade1, Grade2, Grade3, Grade4, Grade5';

  // Reactive variables
  Rx<Teacher?> teacherInfo = Rx<Teacher?>(null);
  var isEditing = false.obs;
  var isAdding = false.obs;
  var isDeleting = false.obs;
  var showInfo = false.obs;
  var myTeachers = <Teacher>[].obs;

  // Subject selection
  List<String> subjectsOptions = ['1', '2', '3'];
  var selectedSubjectsOptionList = <String>[].obs;
  var selectedSubject = "Subject".obs;

  @override
  void onInit() {
    super.onInit();
    print('📌 onInit called in TeachersController');
    fetchTeachers();
  }

  // Fetch teachers from API
  Future<void> fetchTeachers() async {
    print('📌 Fetching teachers from API...');
    try {
      var teachers = await TeachersApi.getTeachers();
      if (teachers.isNotEmpty) {
        myTeachers.assignAll(teachers);
        print('✅ Teachers fetched: ${teachers.length}');
      } else {
        myTeachers.clear();
        print('⚠️ No teachers found!');
      }
    } catch (e) {
      print('❌ Error fetching teachers: $e');
    }
    update();
  }

  // Add a new teacher
  Future<void> addTeacher() async {
    print('🟡 Adding teacher...');
    EasyLoading.show(status: 'Adding teacher...', dismissOnTap: true);

    try {
      bool success = await TeachersApi.addingTeacher(
        firstNameController.text.trim(),
        lastNameController.text.trim(),
        emailController.text.trim(),
        phoneNumberController.text.trim(),
        studyController.text.trim(),
        specializationController.text.trim(),
        universityController.text.trim(),
        graduateYearController.text.trim(),
      );

      if (success) {
        print('✅ Teacher added successfully!');
        EasyLoading.showSuccess('Teacher added successfully!');
        await fetchTeachers();
        clearForm();
        deactivateAddingTeacher();
      } else {
        print('❌ Failed to add teacher.');
        EasyLoading.showError('Failed to add teacher!');
      }
    } catch (e) {
      print('❌ Error adding teacher: $e');
      EasyLoading.showError('An unexpected error occurred!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  // Upload teacher details into form fields
  void uploadTeacher(Teacher teacher) {
    teacherInfo.value = teacher;
    if (teacher != null) {
      firstNameController.text = teacher.firstName ?? '';
      lastNameController.text = teacher.lastName ?? '';
      emailController.text = teacher.email ?? '';
      phoneNumberController.text = teacher.phoneNumber?.toString() ?? '';
      studyController.text = teacher.study ?? '';
      specializationController.text = teacher.specialization ?? '';
      universityController.text = teacher.university ?? '';
      graduateYearController.text = teacher.graduateYear ?? '';
      additionalInfoController.text = teacher.additional ?? '';
      teacherGradesController.text = teacher.grades?.join(', ') ?? '';
    }
  }

  // Clear all form fields
  void clearForm() {
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

  // State management functions
  void startDeleting() => isDeleting.value = true;
  void stopDeleting() => isDeleting.value = false;
  void activateAddingTeacher() => isAdding.value = true;
  void deactivateAddingTeacher() => isAdding.value = false;
  void enableEditing() => isEditing.value = true;
  void disableEditing() => isEditing.value = false;
  void showInformation() => showInfo.value = true;
  void hideInformation() => showInfo.value = false;

  void setSelectedSubject(String value) {
    selectedSubject.value = value;
    update();
  }

  @override
  void onClose() {
    // Dispose controllers to free memory
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    studyController.dispose();
    specializationController.dispose();
    universityController.dispose();
    graduateYearController.dispose();
    additionalInfoController.dispose();
    teacherGradesController.dispose();
    super.onClose();
  }
}
