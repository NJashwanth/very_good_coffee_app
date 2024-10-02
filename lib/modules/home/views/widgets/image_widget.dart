import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:very_good_coffee_app/global/constants.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';

class ImageWidget extends StatefulWidget {
  final CoffeeModel? coffee;
  final File? imageFile;
  final bool isLocal;

  const ImageWidget(
      {super.key, this.coffee, this.imageFile, required this.isLocal});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  late CoffeeModel? coffee;
  late File? imageFile;
  late bool isLocal;

  @override
  void initState() {
    coffee = widget.coffee;
    imageFile = widget.imageFile;
    isLocal = widget.isLocal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                  if (coffee == null && !isLocal)
                    const SizedBox.shrink()
                  else ...{
                    if (!isLocal)
                      Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          color: Colors.white,
                        ),
                      ),
                    isLocal
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            child: Image.file(
                              imageFile!,
                              fit: BoxFit.fill,
                              // add shimmer effect while loading image
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                } else {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 500,
                                    child: AnimatedOpacity(
                                      opacity: frame == null ? 0 : 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeOut,
                                      child: child,
                                    ),
                                  );
                                }
                              },
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 500,
                            child: Image.network(
                              coffee!.imageUrl ?? '',
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // Image loaded successfully
                                }
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 500,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                              // add shimmer effect while loading image
                              frameBuilder: (BuildContext context, Widget child,
                                  int? frame, bool wasSynchronouslyLoaded) {
                                if (wasSynchronouslyLoaded) {
                                  return child;
                                } else {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 500,
                                    child: AnimatedOpacity(
                                      opacity: frame == null ? 0 : 1,
                                      duration: const Duration(seconds: 1),
                                      curve: Curves.easeOut,
                                      child: child,
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                    // Gradient Overlay for Text
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.black54, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Text(
                          (isLocal
                                  ? (imageFile!.path)
                                  : (coffee!.imageUrl ?? ''))
                              .split('/')
                              .last,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    // Favorite Button
                    // if (coffee != null)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6,
                              spreadRadius: 1,
                              offset: Offset(2, 3),
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: Icon(isLocal || coffee!.isLiked
                              ? Icons.favorite
                              : Icons.favorite_border),
                          color: Colors.redAccent,
                          onPressed: () {
                            if (isLocal) {
                              context.read<HomeBloc>().add(
                                  UpdateLikedStatusEvent(
                                      imageUrl: baseUrl +
                                          imageFile!.path.split('/').last,
                                      isLiked: false));
                              setState(() {
                                isLocal = false;
                              });
                              return;
                            }
                            if (coffee!.isLiked) {
                              context.read<HomeBloc>().add(
                                  UpdateLikedStatusEvent(
                                      imageUrl: coffee!.imageUrl ?? '',
                                      isLiked: false));
                              setState(() {
                                coffee = coffee!.copyWith(isLiked: false);
                              });
                            } else {
                              context.read<HomeBloc>().add(
                                  UpdateLikedStatusEvent(
                                      imageUrl: coffee!.imageUrl ?? '',
                                      isLiked: true));
                              setState(() {
                                coffee = coffee!.copyWith(isLiked: true);
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
