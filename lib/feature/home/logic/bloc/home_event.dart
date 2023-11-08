part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

final class Started extends HomeEvent {
  const Started(this.user);

  final UserModel user;
}

final class OnHotelkaItemTap extends HomeEvent {
  const OnHotelkaItemTap(this.index, this.user);

  final int index;
  final UserModel user;
}

final class CreateHotelka extends HomeEvent {
  const CreateHotelka(this.hotelkaModel);

  final HotelkaModel hotelkaModel;
}
