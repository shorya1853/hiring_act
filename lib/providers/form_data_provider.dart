import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/models/employe_model.dart';

final jobPrefeD =
    StateNotifierProvider<JobPreferencNotifier, Map<String,dynamic>>((ref) {
  return JobPreferencNotifier();
});

class JobPreferencNotifier extends StateNotifier<Map<String,dynamic>> {
  JobPreferencNotifier()
      : super({});

  void getJobPref(JobPreference jobpref) {
    Map<String, dynamic> data = jobpref.toJson();
    state = data;
  }
}

final profileD = StateNotifierProvider<ProfileNotifier, Map<String,dynamic>>((ref) {
  return ProfileNotifier();
});

class ProfileNotifier extends StateNotifier<Map<String,dynamic>> {
  ProfileNotifier()
      : super({});

  void getPro(Profile profiled) {
    Map<String, dynamic> data = profiled.toJson();
    state = data;
  }
}

final highED = StateNotifierProvider<HighestEDNotifier, Map<String,dynamic>>((ref) {
  return HighestEDNotifier();
});

class HighestEDNotifier extends StateNotifier<Map<String,dynamic>> {
  HighestEDNotifier()
      : super({});

  void getHigh(HigestEducation highed) {
    Map<String, dynamic> data = highed.toJson();
    state = data;

  }
}
