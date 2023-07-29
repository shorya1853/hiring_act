import 'dart:typed_data';
import 'package:intl/intl.dart';

final formatedDate = DateFormat.yMd();

class JobSeeker{
  Profile profile;
  HigestEducation education;
  JobPreference jobPreference;
  final String? myBio;

  JobSeeker({required this.myBio, required this.profile, required this.education, required this.jobPreference});

  Map<String, dynamic> toJson() =>  {
    'profile': profile.toJson(),
    'education': education.toJson(),
    'jobPreference':  jobPreference.toJson(),
    'myBio': myBio,
  };


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
  final String? gender;
  final String iam;
  final String? fullName;
  final DateTime dob;
  final String? email;
  final Uint8List? image;

  Profile({required this.gender, required this.iam, required this.fullName, required this.dob, required this.email, required this.image});

  Map<String, dynamic> toJson ()=> {
    'gender': gender,
    'iam': iam,
    'fullName': fullName,
    'dob': dob,
    'email': email,
    'image': image,
  };

}


class HigestEducation{
  final String? instituteName;
  final String? edLevel;
  final DateTime duration;

  HigestEducation({required this.instituteName, required this.edLevel, required this.duration});

  Map<String, dynamic> toJson() => {
    'instituteName': instituteName,
    'edlevel': edLevel,
    'duration': duration,
  };
}


class JobPreference{
  final String jobType;
  final String? functionArea;
  final String? preferedCity;
  final String expectedSalary;

  JobPreference({required this.jobType, required this.functionArea, required this.preferedCity, required this.expectedSalary});

  Map<String, dynamic> toJson () => {
    'jobType': jobType,
    'functionArea': functionArea,
    'preferedCity': preferedCity,
    'expectedSalary': expectedSalary,
  };
  
  
}