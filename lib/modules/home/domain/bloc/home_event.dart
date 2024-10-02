part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class LoadCoffeeEvent extends HomeEvent {
  const LoadCoffeeEvent();
}

class UpdateLikedStatusEvent extends HomeEvent {
  final String imageUrl;
  final bool isLiked;

  const UpdateLikedStatusEvent({required this.imageUrl, required this.isLiked});
}

class LoadFavoritesEvent extends HomeEvent {}
