import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:school_management_system/models/teacher.dart';

class TeachersApi {
  // 🆕 ADD OR UPDATE TEACHER
  static Future<bool> addingTeacher(
      String firstName,
      String lastName,
      String email,
      String phone,
      String study,
      String specialization,
      String university,
      String graduateYear,
      ) async {
    try {
      var existingTeachers = await FirebaseFirestore.instance
          .collection('teacher')
          .where('email', isEqualTo: email)
          .get();

      if (existingTeachers.docs.isNotEmpty) {
        // 🔄 Update existing teacher
        String docId = existingTeachers.docs.first.id;

        final data = {
          "University": university,
          "email": email,
          "first_name": firstName,
          "graduateYear": graduateYear,
          "last_name": lastName,
          "specialization": specialization,
          "study": study,
          "phone": phone, // ✅ Keep phone as String
        };

        await FirebaseFirestore.instance.collection("teacher").doc(docId).update(data);
        print("✅ Teacher updated successfully!");
        return true;
      }

      // 🔥 Add new teacher with Firestore-generated ID
      var docRef = FirebaseFirestore.instance.collection("teacher").doc();

      final data = {
        "uid": docRef.id, // ✅ Use Firestore-generated ID
        "University": university,
        "email": email,
        "first_name": firstName,
        "graduateYear": graduateYear,
        "last_name": lastName,
        "specialization": specialization,
        "study": study,
        "phone": phone, // ✅ Keep phone as String
        "urlAvatar": "https://default-avatar-url.com",
        "token": "nothing",
      };

      await docRef.set(data);
      print("✅ Teacher added successfully with UID: ${docRef.id}");
      return true;

    } catch (e) {
      print("❌ Error adding/updating teacher: $e");
      return false;
    }
  }

  // 📌 GET ALL TEACHERS
  static Future<List<Teacher>> getTeachers() async {
    List<Teacher> allTeachers = [];

    try {
      var snapshot = await FirebaseFirestore.instance.collection('teacher').get();

      if (snapshot.docs.isEmpty) {
        print("⚠️ No teachers found in Firestore!");
      }

      for (var doc in snapshot.docs) {
        var data = doc.data();

        allTeachers.add(
          Teacher(
            id: doc.id, // ✅ Always use Firestore document ID
            firstName: data.containsKey('first_name') ? data['first_name'] ?? '' : '',
            lastName: data.containsKey('last_name') ? data['last_name'] ?? '' : '',
            phoneNumber: data.containsKey('phone') ? data['phone'].toString() : '',
            email: data.containsKey('email') ? data['email'] ?? '' : '',
            study: data.containsKey('study') ? data['study'] ?? '' : '',
            specialization: data.containsKey('specialization') ? data['specialization'] ?? '' : '',
            university: data.containsKey('University') ? data['University'] ?? '' : '',
            graduateYear: data.containsKey('graduateYear') ? data['graduateYear'].toString() : '',
          ),
        );
      }

      print("📌 Teachers fetched: ${allTeachers.length}");
    } catch (e) {
      print("❌ Error fetching teachers: $e");
    }

    return allTeachers;
  }

  // ✅ DEBUG FUNCTION: FETCH TEACHERS AND PRINT IN CONSOLE
  static Future<void> testFirestoreFetch() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('teacher').get();

      if (snapshot.docs.isEmpty) {
        print("⚠️ No teachers found in Firestore!");
        return;
      }

      for (var doc in snapshot.docs) {
        print("👤 Firestore Data: ${doc.data()}");
      }

      print("📌 Total Teachers: ${snapshot.docs.length}");
    } catch (e) {
      print("❌ Error fetching teachers: $e");
    }
  }
}
