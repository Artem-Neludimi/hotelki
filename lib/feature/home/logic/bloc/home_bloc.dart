import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/feature/home/data/home_respository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with BlocLoggy {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeInitial()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        Started() => _onStarted(event, emit),
        OnHotelkaItemTap() => _onHotelkaItemTap(event, emit),
      },
    );
  }
  Future<void> _onStarted(Started event, Emitter<HomeState> emit) async {
    if (event.user.partnerEmail == null) {
      return emit(const HomeNoPartner());
    }
    try {
      final hotelki = await _repository.getHotelkaModels(event.user.email);
      loggy.info('hotelki: $hotelki');
      emit(HomeLoaded(hotelki));
    } catch (e, s) {
      loggy.error(e, s);
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onHotelkaItemTap(OnHotelkaItemTap event, Emitter<HomeState> emit) async {
    final hotelkaItems = [...state.hotelkaItems];
    // hotelkaItems[event.index] = (
    //   hotelkaItems[event.index].$1,
    //   !hotelkaItems[event.index].$2,
    //   hotelkaItems[event.index].$3,
    // );
    // emit(HomeLoaded(hotelkaItems));
  }
}

const List<(String, bool, bool)> mockHotelkaItems = [
  ('Обнимашки', false, false),
  ('Романтический ужин', false, false),
  ('Букет цветов', false, false),
  ('Обнимашки', false, false),
  ('Фотосессия в 19:00', false, true),
  ('Обнимашки', false, false),
];
