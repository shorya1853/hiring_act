import 'package:flutter_riverpod/flutter_riverpod.dart';


class CheckDataNotifier extends StateNotifier<bool>{
  CheckDataNotifier(): super(false);

  


}

final ifExisit = StateNotifierProvider<CheckDataNotifier, bool>((ref){
  return CheckDataNotifier();
} );

