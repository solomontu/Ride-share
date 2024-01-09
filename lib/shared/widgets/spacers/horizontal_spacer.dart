import 'package:flutter/cupertino.dart';

class HSpace extends StatelessWidget {
  const HSpace(this.width, {super.key});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
