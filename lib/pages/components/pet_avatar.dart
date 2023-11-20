// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pet_health/constants/assets.dart';

class PetAvatar extends StatelessWidget {
  final String? petInitials;
  final String? petAvatarPath;

  double? borderRadius = 20;
  double? radius = 18;

  PetAvatar(
      {super.key,
      this.petInitials,
      this.petAvatarPath,
      this.borderRadius,
      this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: borderRadius,
      backgroundColor: Colors.black12,
      child: CircleAvatar(
        radius: radius,
        backgroundImage: const AssetImage(petAvatar),
        foregroundImage:
            petAvatarPath != null ? AssetImage(petAvatarPath!) : null,
      ),
    );
  }
}
