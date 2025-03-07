class Teacher {
  var id;
  String? firstName;
  String? lastName;
  String? email;
  var phoneNumber;
  String? study;
  String? university;
  String? specialization; // ✅ Fixed spelling
  String? graduateYear;
  String? additional;
  List? subjects;
  List? grades;
  List? classes;

  Teacher({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.study,
    this.specialization, // ✅ Fixed spelling
    this.university,
    this.graduateYear,
    this.subjects,
    this.grades,
    this.classes,
    this.id,
    this.additional
  });
}

List teachers = [
  Teacher(
      firstName: 'firstName1',
      lastName: 'lastName1',
      email: 'email1',
      phoneNumber: 'phoneNumber1',
      study: 'study1',
      specialization: 'specialization1', // ✅ Fixed spelling
      university: 'university1',
      graduateYear: 'graduateYear1',
      subjects: ['subject 1', 'subject 2', 'subject 3','subject 4','subject 5','subject 6','subject 7','subject 8'],
      grades: ['grade1', 'grade 2', 'grade 3'],
      classes: ['class1', 'classe 2', 'class3'],
      additional: 'additional1'),
  Teacher(
      firstName: 'firstName2',
      lastName: 'lastName2',
      email: 'email2',
      phoneNumber: 'phoneNumber2',
      study: 'study2',
      specialization: 'specialization2', // ✅ Fixed spelling
      university: 'university2',
      graduateYear: 'graduateYear2',
      subjects: ['subject 1', 'subject 2', 'subject 3'],
      grades: ['grade1', 'grade 2', 'grade 3'],
      classes: ['class1', 'classe 2', 'class3'],
      additional: 'additional2'),
  Teacher(
      firstName: 'firstName3',
      lastName: 'lastName3',
      email: 'email3',
      phoneNumber: 'phoneNumber3',
      study: 'study3',
      specialization: 'specialization3', // ✅ Fixed spelling
      university: 'university3',
      graduateYear: 'graduateYear3',
      subjects: ['subject 1', 'subject 2', 'subject 3'],
      grades: ['grade1', 'grade 2', 'grade 3'],
      classes: ['class1', 'classe 2', 'class3'],
      additional: 'additional3'),
  Teacher(
      firstName: 'firstName4',
      lastName: 'lastName4',
      email: 'email4',
      phoneNumber: 'phoneNumber4',
      study: 'study4',
      specialization: 'specialization4', // ✅ Fixed spelling
      university: 'university4',
      graduateYear: 'graduateYear4',
      subjects: ['subject 1', 'subject 2', 'subject 3'],
      grades: ['grade1', 'grade 2', 'grade 3'],
      classes: ['class1', 'classe 2', 'class3'],
      additional: 'additional4'),
  Teacher(
      firstName: 'firstName5',
      lastName: 'lastName5',
      email: 'email5',
      phoneNumber: 'phoneNumber5',
      study: 'study5',
      specialization: 'specialization5', // ✅ Fixed spelling
      university: 'university5',
      graduateYear: 'graduateYear5',
      subjects: ['subject 1', 'subject 2', 'subject 3'],
      grades: ['grade1', 'grade 2', 'grade 3'],
      classes: ['class1', 'classe 2', 'class3'],
      additional: 'additional5'),
];
