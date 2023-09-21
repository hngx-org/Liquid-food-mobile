import 'package:flutter/material.dart';
import 'dart:io';

/// A widget that displays an avatar image uploaded by the user.
///
/// The `image` parameter is required and should be a `String` representing
/// the URL or file path of the image to display.
///
/// The `width` and `height` parameters are optional and default to 56.0.
///
/// The `radius` parameter is optional and defaults to 16.0.
class AvatarWidget extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double radius;

  const AvatarWidget({
    Key? key,
    required this.image,
    this.width = 56.0,
    this.height = 56.0,
    this.radius = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: FileImage(
            File(image),
          )
        ),
      ),
    );
  }
}