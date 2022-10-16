import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({Key? key, required this.onTap, required this.buttonTitle})
      : super(key: key);

  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomCardColor,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(bottom: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
