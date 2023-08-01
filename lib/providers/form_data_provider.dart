import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';

final jobPrefeD =
    StateNotifierProvider<JobPreferencNotifier, JobPreference>((ref) {
  return JobPreferencNotifier();
});

class JobPreferencNotifier extends StateNotifier<JobPreference> {
  JobPreferencNotifier()
      : super(JobPreference(
            jobType: '',
            functionArea: 'functionArea',
            preferedCity: 'preferedCity',
            expectedSalary: '0'));

  void getJobPref(JobPreference jobpref) {
    state = jobpref;
  }
}

final profileD = StateNotifierProvider<ProfileNotifier, Profile>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier()
      : super(Profile(
            gender: genders.male.name,
            iam: Iam.Expriences.name,
            fullName: "fullName",
            dob: DateTime.now(),
            email: "",
            image: null));

  void getPro(Profile profiled) {
    state = profiled;
  }
}

final highED = StateNotifierProvider<HighestEDNotifier, HigestEducation>((ref) {
  return HighestEDNotifier();
});

class HighestEDNotifier extends StateNotifier<HigestEducation> {
  HighestEDNotifier()
      : super(HigestEducation(
            instituteName: 'instituteName',
            edLevel: 'edLevel',
            duration: ''));

  void getHigh(HigestEducation highed) {
    state = highed;
  }
}
