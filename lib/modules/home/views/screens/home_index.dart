import 'package:flutter/material.dart';
import 'package:very_good_coffee_app/global/utilities/layout_resolver.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/home_screen_portrait.dart';

class HomeIndex extends StatefulWidget {
  const HomeIndex({super.key});

  @override
  State<HomeIndex> createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const LayoutResolver(
      landscapeWidget: HomeScreenPortrait(),
      portraitWidget: HomeScreenPortrait(),
    );
  }
}
