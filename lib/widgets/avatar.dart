import 'package:flutter/material.dart';

// The avatar widget 
// This widgets requires the width and height you'll want to avatar to be
// And an ImageProvider Object to display 
// I chose Imageprovider type in order to be able to use an AssetImage widget during testing and A NetworkImage Widget during production
class AvatarComponent extends StatelessWidget {
  final ImageProvider<Object> image;
  final double width;
  final double height;
  const AvatarComponent(
      {super.key,
      required this.image,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
