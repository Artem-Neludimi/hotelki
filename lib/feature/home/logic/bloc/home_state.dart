part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState(this._hotelkaItems);

  final List<(String, bool, bool)>? _hotelkaItems;
  List<(String, bool, bool)> get hotelkaItems => _hotelkaItems!;

  double get percentHotelkaItemsDone {
    final done = _hotelkaItems!.where((item) => item.$2).length;
    final total = _hotelkaItems!.length;
    return done / total;
  }
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(null);
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(super.hotelkaItems);
}
