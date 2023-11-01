part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

final class Started extends HomeEvent {
  const Started();
}

final class OnHotelkaItemTap extends HomeEvent {
  const OnHotelkaItemTap(this.index);

  final int index;
}