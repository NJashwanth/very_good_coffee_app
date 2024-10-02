import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:very_good_coffee_app/modules/home/domain/home_client.dart';
import 'package:very_good_coffee_app/modules/home/models/coffee_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  CoffeeClient _client = CoffeeClient();

  @visibleForTesting
  setCoffeeClient(CoffeeClient client) {
    _client = client;
  }

  HomeBloc() : super(HomeInitialState()) {
    on<HomeEvent>((event, emit) {});
    on<LoadCoffeeEvent>(_handleLoadCoffeeEvent);
    on<UpdateLikedStatusEvent>(_handleLikedStatus);
    on<LoadFavoritesEvent>(_handleFetchFavs);
  }

  Future<void> _handleLoadCoffeeEvent(
      LoadCoffeeEvent event, Emitter<HomeState> emit) async {
    emit(CoffeeLoadingState());
    await _client.fetchCoffeeImage(onSuccess: (CoffeeModel coffee) {
      emit(CoffeeLoadedState(coffeeModel: coffee));
      
    }, onError: (String? errorMessage) {
      emit(CoffeeErrorState());
    });
  }

  Future<void> _handleLikedStatus(
      UpdateLikedStatusEvent event, Emitter<HomeState> emit) async {
    String url = event.imageUrl;
    bool isLiked = event.isLiked;
    if (isLiked) {
      await _client.saveLikedImage(url);
    } else {
      await _client.removeLikedImage(url);
    }
  }

  Future<void> _handleFetchFavs(
      LoadFavoritesEvent event, Emitter<HomeState> emit) async {
    emit(FavLoadingState());
    List<String> favs = await _client.getLikedImages();
    emit(FavLoadedState(favs: favs));
  }
}
