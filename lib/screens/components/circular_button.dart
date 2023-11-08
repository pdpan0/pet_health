import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onTap;
  final String assetName;

  const CircularButton({
    super.key,
    required this.onTap,
    required this.assetName
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      onPressed: onTap,
      icon: CircleAvatar(
        backgroundImage: AssetImage(assetName)
      )
    );
  }
}