import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        Started() => _onStarted(event, emit),
        OnHotelkaItemTap() => _onHotelkaItemTap(event, emit),
      },
    );
  }
  Future<void> _onStarted(Started event, Emitter<HomeState> emit) async {
    if (event.user.partnerEmail == null) {
      emit(const HomeNoPartner());
    } else {
      emit(const HomeLoaded(mockHotelkaItems));
    }
  }

  Future<void> _onHotelkaItemTap(OnHotelkaItemTap event, Emitter<HomeState> emit) async {
    final hotelkaItems = [...state.hotelkaItems];
    hotelkaItems[event.index] = (
      hotelkaItems[event.index].$1,
      !hotelkaItems[event.index].$2,
      hotelkaItems[event.index].$3,
    );
    emit(HomeLoaded(hotelkaItems));
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
