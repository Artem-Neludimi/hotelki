part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState(this._hotelki, this._categories);

  final List<HotelkaModel>? _hotelki;
  final List<CategoryModel>? _categories;

  List<HotelkaModel> get hotelki => _hotelki!;
  List<CategoryModel> get categories => _categories!;
  List<String> get categoriesString => _categories!.map((item) => item.category).toList();
  List<String> get activeCategoriesString => _hotelki!.map((item) => item.category).toSet().toList();

  double? get percentHotelkaItemsDone {
    final done = _hotelki!.where((item) => item.isDone).length;
    final total = _hotelki!.length;
    if (total == 0) return null;
    return done / total;
  }
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(null, null);
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(super.hotelkaItems, super._categories);
}

final class HomeNoPartner extends HomeState {
  const HomeNoPartner() : super(null, null);
}

final class HomeError extends HomeState {
  const HomeError(this.error) : super(null, null);

  final String error;
}
