import 'package:flutter/material.dart';
import '../../constants.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, this.hintText, this.maxLines=1, this.onSaved, this.onChanged});
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged:onChanged ,
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:TextStyle(color:kPrimaryColor),
        border: buildBorder(),
        focusedBorder:buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10),),
        borderSide:BorderSide(color: color ?? Colors.white),
      );
  }
}
