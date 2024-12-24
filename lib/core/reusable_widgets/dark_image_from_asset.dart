import 'package:flutter/material.dart';
import 'package:press/core/utils/app_paths.dart';

class DarkImageFromAsset extends StatelessWidget {
  final String imageName;
  final BoxFit fit;
  final double? width;
  final double? height;

  const DarkImageFromAsset({
    super.key,
    required this.imageName,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      '${AppPaths.darkImagesPath}$imageName',
      height: height,
      width: width,
      fit: fit,
    );
  }
}