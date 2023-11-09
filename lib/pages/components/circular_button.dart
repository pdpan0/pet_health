import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onTap;
  final AssetImage backgroundImage;

  const CircularButton({
    super.key,
    required this.onTap,
    required this.backgroundImage
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30.0,
      onPressed: onTap,
      icon: CircleAvatar(
        backgroundImage: backgroundImage
      )
    );
  }
}