part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => <Object?>[];
}

class HomeInitialState extends HomeState {}

class CoffeeLoadedState extends HomeState {
  final CoffeeModel coffeeModel;

  const CoffeeLoadedState({required this.coffeeModel});
}

class CoffeeLoadingState extends HomeState {}

class CoffeeErrorState extends HomeState {}

class FavLoadingState extends HomeState {}

class FavLoadedState extends HomeState {
  final List<String> favs;

  const FavLoadedState({required this.favs});
}

class FavErrorState extends HomeState {}
