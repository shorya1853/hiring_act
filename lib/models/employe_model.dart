

class JobSeeker{
  Profile profile;
  HigestEducation education;
  JobPreference jobPreference;
  final String myBio;

  JobSeeker(this.myBio, this.profile, this.education, this.jobPreference);
}
enum genders{
  male,
  female,
}

class Profile{
  final String name;
  final genders gender;
  final String iam;
  final String fullName;
  final DateTime dob;
  final String email;

  Profile(this.name, this.gender, this.iam, this.fullName, this.dob, this.email);
}
class HigestEducation{
  final String instituteName;
  final String edLevel;
  final DateTime duration;

  HigestEducation(this.instituteName, this.edLevel, this.duration);
}

enum jobTypes  {
  Internship,
  Freacher,
  Expriences
}
const jobType = {
  jobTypes.Internship: 'Internship',
  jobTypes.Expriences: 'Expriences',
  jobTypes.Freacher: 'Freacher',
};

class JobPreference{
  final jobTypes jobType;
  final String functionArea;
  final String preferedCity;
  final int expectedSalary;

  JobPreference(this.jobType, this.functionArea, this.preferedCity, this.expectedSalary);

  
}