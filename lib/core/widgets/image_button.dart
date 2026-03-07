import 'package:flutter/material.dart';
import 'package:memento/core/theme/color_extensions.dart';

class ImageButton extends StatefulWidget {
  final String imagePath;
  final VoidCallback onTap;
  const ImageButton({super.key, required this.imagePath, required this.onTap});

  @override
  State<ImageButton> createState() => _ImageButtonState();
}

class _ImageButtonState extends State<ImageButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 27.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: Theme.of(
            context,
          ).extension<ColorExtensions>()!.fillGreySurface,
          border: Border.all(
            color: Theme.of(
              context,
            ).extension<ColorExtensions>()!.borderDefault,
            width: 5.0,
          ),
          borderRadius: BorderRadius.circular(9.0),
        ),
        child: Image.asset(widget.imagePath),
      ),
    );
  }
}
