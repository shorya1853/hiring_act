import 'package:flutter/material.dart';

class WidgetTextField extends StatelessWidget {
  WidgetTextField(this.hintText,{super.key, required this.textController, required this.lable});
  TextEditingController? textController = TextEditingController();
  late String lable;
  late String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Padding(
        padding: const EdgeInsets.only(left: 5, top: 5),
        child: Text(lable, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: TextField(
                controller: textController,
                decoration:  InputDecoration(
                  hintText: hintText 
                )
              ),
            )
    ],);
  }
}