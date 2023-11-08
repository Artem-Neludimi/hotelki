import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/category/category_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/feature/home/data/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> with BlocLoggy {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeInitial()) {
    on<HomeEvent>(
      (event, emit) => switch (event) {
        Started() => _onStarted(event, emit),
        OnHotelkaItemTap() => _onHotelkaItemTap(event, emit),
        CreateHotelka() => _createHotelka(event, emit),
      },
    );
  }
  Future<void> _onStarted(Started event, Emitter<HomeState> emit) async {
    emit(const HomeInitial());
    if (event.user.partnerEmail == null) {
      return emit(const HomeNoPartner());
    }
    try {
      final hotelki = await _repository.getHotelkaModels(event.user.email);
      final categories = await _repository.getCategories(event.user.partnerEmail!);
      loggy.info('hotelki: $hotelki');
      loggy.info('categories: $categories');
      emit(HomeLoaded(hotelki, categories));
    } catch (e, s) {
      loggy.error(e, s);
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onHotelkaItemTap(OnHotelkaItemTap event, Emitter<HomeState> emit) async {
    final hotelkaAndId = state.hotelkaAndIdByIndex(event.index);
    await _repository.updateHotelka(hotelkaAndId.$2.copyWith(isDone: !hotelkaAndId.$2.isDone), hotelkaAndId.$1);
    final hotelki = await _repository.getHotelkaModels(event.user.email);
    final categories = await _repository.getCategories(event.user.partnerEmail!);
    loggy.info('hotelki: $hotelki');
    loggy.info('categories: $categories');
    emit(HomeLoaded(hotelki, categories));
  }

  Future<void> _createHotelka(CreateHotelka event, Emitter<HomeState> emit) async {
    try {
      _repository.createHotelka(event.hotelkaModel);
      loggy.info('hotelkaModel: ${event.hotelkaModel}');
    } catch (e, s) {
      loggy.error(e, s);
      emit(HomeError(e.toString()));
    }
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
