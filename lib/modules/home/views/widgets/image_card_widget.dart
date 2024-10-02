import 'dart:io';

import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';

class ImageCardWidget extends StatefulWidget {
  final CoffeeModel? coffeeModel;
  final File? imageFile;
  final bool isLocal;
  const ImageCardWidget({
    super.key,
    this.coffeeModel,
    this.imageFile,
    required this.isLocal,
  });

  @override
  State<ImageCardWidget> createState() => _ImageCardWidgetState();
}

class _ImageCardWidgetState extends State<ImageCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              spreadRadius: 5,
              offset: Offset(0, 10), // Adds a soft shadow below the image
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Stack(
            children: [
              widget.isLocal
                  ? Image.file(
                      widget.imageFile!,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      widget.coffeeModel!.imageUrl ?? '',
                      fit: BoxFit.fill,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
