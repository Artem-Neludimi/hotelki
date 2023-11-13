import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scalable_flutter_app_starter/core/logger/loggy_types.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/category/category_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/hotelka/hotelka_model.dart';
import 'package:scalable_flutter_app_starter/core/services/api/model/user/user_model.dart';
import 'package:scalable_flutter_app_starter/feature/home/data/home_repository.dart';
import 'package:scalable_flutter_app_starter/feature/home/domain/category_story_model.dart';

import '../../../../core/services/firebase/storage/firebase_links.dart';

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

  final List<CategoryModel> _categories = [];
  List<CategoryModel> get categories => _categories;
  List<String> get categoriesString => _categories.map((item) => item.category).toList();

  Future<void> _onStarted(Started event, Emitter<HomeState> emit) async {
    emit(const HomeInitial());
    if (event.user.partnerEmail == null) {
      return emit(const HomeNoPartner());
    }
    try {
      final hotelkiStream = _repository.streamHotelkaModels(event.user.email);
      _categories.clear();
      _categories.addAll(await _repository.getCategories(event.user.partnerEmail!));
      loggy.info('hotelki: $hotelkiStream');
      loggy.info('categories: $_categories');
      await emit.onEach(hotelkiStream, onData: (hotelki) {
        loggy.info('hotelki: $hotelki');
        emit(HomeLoaded(hotelki));
      });
    } catch (e, s) {
      loggy.error(e, s);
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onHotelkaItemTap(OnHotelkaItemTap event, Emitter<HomeState> emit) async {
    try {
      final hotelkaAndId = state.hotelkaAndIdByIndex(event.index);
      await _repository.updateHotelka(hotelkaAndId.$2.copyWith(isDone: !hotelkaAndId.$2.isDone), hotelkaAndId.$1);
    } catch (e) {
      loggy.error(e);
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _createHotelka(CreateHotelka event, Emitter<HomeState> emit) async {
    try {
      await _repository.createHotelka(event.hotelkaModel, event.referencesImagesPaths);
      _categories.clear();
      _categories.addAll(await _repository.getCategories(event.hotelkaModel.email));
      loggy.info('hotelka create: ${event.hotelkaModel}');
      loggy.info('categories: $_categories');
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
