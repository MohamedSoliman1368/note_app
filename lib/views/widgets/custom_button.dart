import 'package:flutter/material.dart';
import '../../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, this.isLoading = false});
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor,
        ),
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child:
              isLoading
                  ? SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(color: Colors.black),
                  )
                  : Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        ),
      ),
    );
  }
}
