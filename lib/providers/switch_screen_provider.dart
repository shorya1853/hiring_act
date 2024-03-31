import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';

class FinalData extends StateNotifier<JobSeeker?> {
  FinalData() : super(null) {
    getDatas();
  }

  void getDatas() async {
    var jobkeeper = await GetData.getdata();
    state = jobkeeper;
  }
}

final finalData = StateNotifierProvider<FinalData, JobSeeker?>((ref) {
  return FinalData();
});


// final finalData = StateProvider((ref) async {
//   var jobkeeper = await GetData.getdata();
//   return jobkeeper;
// });
