part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState(this._hotelkaItems);

  final List<HotelkaModel>? _hotelkaItems;
  List<HotelkaModel> get hotelkaItems => _hotelkaItems!;

  double? get percentHotelkaItemsDone {
    final done = _hotelkaItems!.where((item) => item.isDone).length;
    final total = _hotelkaItems!.length;
    if (total == 0) return null;
    return done / total;
  }
}

final class HomeInitial extends HomeState {
  const HomeInitial() : super(null);
}

final class HomeLoaded extends HomeState {
  const HomeLoaded(super.hotelkaItems);
}

final class HomeNoPartner extends HomeState {
  const HomeNoPartner() : super(null);
}

final class HomeError extends HomeState {
  const HomeError(this.error) : super(null);

  final String error;
}
