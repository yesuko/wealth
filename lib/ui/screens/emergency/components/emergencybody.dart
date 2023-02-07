import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmergencyBody extends StatelessWidget {
  const EmergencyBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset("assets/images/emergency_bg.svg"));
  }
}
