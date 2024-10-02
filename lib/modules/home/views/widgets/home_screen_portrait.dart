import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_coffee_app/modules/home/domain/bloc/home_bloc.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/fav_button_widget.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/image_widget.dart';
import 'package:very_good_coffee_app/modules/home/views/widgets/next_image_button.dart';

class HomeScreenPortrait extends StatefulWidget {
  const HomeScreenPortrait({super.key});

  @override
  State<HomeScreenPortrait> createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
  @override
  void initState() {
    context.read<HomeBloc>().add(const LoadCoffeeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Very Good Coffee'),
        ),
        floatingActionButton: const FavButtonWidget(),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {},
          buildWhen: (previous, current) =>
              current is! FavLoadedState &&
              current is! FavLoadingState &&
              current is! FavErrorState,
          builder: (context, state) {
            switch (state) {
              case CoffeeErrorState():
                return const Center(
                  child: Text('Unable to load Coffee. Please try again later'),
                );
              case CoffeeLoadedState():
                CoffeeModel coffeeModel = state.coffeeModel;
                return CoffeeSection(coffeeModel: coffeeModel);
              default: //covers loading state
                return const Center(
                  child: CircularProgressIndicator(),
                );
            }
          },
        ),
      );
    });
  }
}

class CoffeeSection extends StatefulWidget {
  final CoffeeModel coffeeModel;
  const CoffeeSection({super.key, required this.coffeeModel});

  @override
  State<CoffeeSection> createState() => _CoffeeSectionState();
}

class _CoffeeSectionState extends State<CoffeeSection> {
  late CoffeeModel coffee;

  @override
  void initState() {
    coffee = widget.coffeeModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
      child: Column(
        children: [
          ImageWidget(
            coffee: coffee,
            isLocal: false,
          ),
          const NextImageButton(),
        ],
      ),
    );
  }
}
