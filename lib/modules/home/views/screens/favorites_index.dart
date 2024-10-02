import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/instance_manager.dart';
import 'package:very_good_coffee_app/global/utilities/layout_resolver.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/domain/home_client.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/image_widget.dart';

class FavoritesIndex extends StatelessWidget {
  const FavoritesIndex({super.key});

  static String routeName = 'fav';
  static String routePath = '/fav';

  @override
  Widget build(BuildContext context) {
    return const LayoutResolver(
      landscapeWidget: FavoritesScreenPortrait(),
      portraitWidget: FavoritesScreenPortrait(),
    );
  }
}

class FavoritesScreenPortrait extends StatefulWidget {
  const FavoritesScreenPortrait({super.key});

  @override
  State<FavoritesScreenPortrait> createState() =>
      _FavoritesScreenPortraitState();
}

class _FavoritesScreenPortraitState extends State<FavoritesScreenPortrait> {
  @override
  void initState() {
    context.read<HomeBloc>().add(LoadFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            current is FavErrorState ||
            current is FavLoadedState ||
            current is FavLoadingState,
        builder: (context, state) {
          if (state is FavErrorState) {
            return const Center(
              child: Text('Unable to load liked items'),
            );
          }
          if (state is FavLoadedState) {
            List<String> favs = state.favs;
            if (favs.isEmpty) {
              return const Center(
                child: Text('No Favorites'),
              );
            }
            return ListView.builder(
              itemCount: favs.length,
              itemBuilder: (context, index) {
                return FavImageSection(imageUrl: favs[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class FavImageSection extends StatefulWidget {
  final String imageUrl;
  const FavImageSection({super.key, required this.imageUrl});

  @override
  State<FavImageSection> createState() => _FavImageSectionState();
}

class _FavImageSectionState extends State<FavImageSection> {
  late String fileName;

  @override
  void initState() {
    fileName = widget.imageUrl.split('/').last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CoffeeClient client = Get.find<CoffeeClient>();
    return FutureBuilder(
      future: client.getImageFileByName(fileName),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        if (snapshot.connectionState == ConnectionState.done) {
          File? file = snapshot.data;
          if (file != null && file.existsSync()) {
            return ImageWidget(
              isLocal: true,
              imageFile: file,
            );
          } else {
            return const Text('File not exists: ');
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
