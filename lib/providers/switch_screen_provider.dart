import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hearing_act/methods/firestore_method.dart';
import 'package:hearing_act/models/employe_model.dart';

final finalData = StateNotifierProvider((ref) {
  return FinalData(ref);
});

class FinalData extends StateNotifier{
  FinalData(super.state);

  void getDatas()async{
    var jobkeeper = await GetData().getdata();
    state = jobkeeper;
  }

}



