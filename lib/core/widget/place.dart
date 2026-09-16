

import 'package:flutter/material.dart';
import 'package:contacts_app/core/utils/color/color.dart';
import 'package:contacts_app/core/utils/animations/animation.dart';
import 'package:lottie/lottie.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(AnimationApp.list),
          const Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              color: ColorApp.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}