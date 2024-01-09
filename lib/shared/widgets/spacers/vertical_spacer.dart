import 'package:flutter/material.dart';

class VSpace extends StatelessWidget {
  const VSpace(this.height, {super.key});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
