import 'package:flutter/material.dart';
import 'package:pet_health/constants/assets.dart';

class PetAvatar extends StatelessWidget {
  final String petInitials;
  final String? petAvatarPath;

  const PetAvatar({
    super.key,
    required this.petInitials,
    this.petAvatarPath,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      foregroundImage: petAvatarPath != null ? AssetImage(petAvatarPath!) : null,
      backgroundImage: const AssetImage(pet_avatar),
      // backgroundColor: Colors.blue,
      // child: Text(petInitials),
    );
  }
}
