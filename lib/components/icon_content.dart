import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.logo, required this.name})
      : super(key: key);

  final IconData logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          logo,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          name,
          style: kLableTextStyle,
        ),
      ],
    );
  }
}
