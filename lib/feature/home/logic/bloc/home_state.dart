part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState(this._hotelki);

  final Map<String, HotelkaModel>? _hotelki;

  List<HotelkaModel> get hotelki => _hotelki!.values.toList();
  List<String> get activeCategoriesString => hotelki
      .where((element) =>
          element.references != null && (element.references?.link != null && element.references!.link!.isNotEmpty) ||
          (element.references?.imageUrls != null && element.references!.imageUrls!.isNotEmpty))
      .map((item) => item.category)
      .toSet()
      .toList();
  (String, HotelkaModel) hotelkaAndIdByIndex(int index) {
    final hotelka = hotelki[index];
    return (_hotelki!.keys.toList()[index], hotelka);
  }

  double? get percentHotelkaItemsDone {
    final done = hotelki.where((item) => item.isDone).length;
    final total = _hotelki!.length;
    if (total == 0) return null;
    return done / total;
  }

  List<CategoryStoryData> buildCategoryStories(String category) {
    final List<HotelkaModel> hotelkiWithCategory = hotelki.where((item) => item.category == category).toList();
    return [
      for (var hotelka in hotelkiWithCategory)
        CategoryStoryData(
          name: hotelka.name,
          description: hotelka.description,
          link: hotelka.references?.link ?? '',
          isImportant: hotelka.isImportant,
          imageUrls: hotelka.references?.imageUrls ?? [FirebaseLinks.coolBackground],
        ),
    ];
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
