part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  const HomeState(this._hotelki, this._categories);

  final Map<String, HotelkaModel>? _hotelki;
  final List<CategoryModel>? _categories;

  List<HotelkaModel> get hotelki => _hotelki!.values.toList();
  List<CategoryModel> get categories => _categories!;
  List<String> get categoriesString => _categories!.map((item) => item.category).toList();
  List<String> get activeCategoriesString => hotelki.map((item) => item.category).toSet().toList();
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
