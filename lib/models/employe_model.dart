import 'dart:io';
import 'package:intl/intl.dart';

final formatedDate = DateFormat.yMd();

class JobSeeker{
  Profile profile;
  HigestEducation education;
  JobPreference jobPreference;
  final String? myBio;

  JobSeeker(this.myBio, this.profile, this.education, this.jobPreference);
}
enum genders{
  male,
  female,
}
const gendertype = {
  genders.male: 'male',
  genders.female: 'female'
};
enum Iam  {
  Internship,
  Freacher,
  Expriences
}
const Iamtype = {
  Iam.Internship: 'Internship',
  Iam.Expriences: 'Expriences',
  Iam.Freacher: 'Freacher',
};


class Profile{
  final String name;
  final genders gender;
  final Iam iam;
  final String fullName;
  final DateTime dob;
  final String email;
  final File? image;

  Profile(this.name, this.gender, this.iam, this.fullName, this.dob, this.email, this.image);
}
class HigestEducation{
  final String instituteName;
  final String edLevel;
  final DateTime duration;

  HigestEducation(this.instituteName, this.edLevel, this.duration);
}


class JobPreference{
  final String jobType;
  final String? functionArea;
  final String? preferedCity;
  final int expectedSalary;

  JobPreference(this.jobType, this.functionArea, this.preferedCity, this.expectedSalary);

  
}