import '../../../api/model/category/category_model.dart';

abstract class DefaultCategories {
  static List<CategoryModel> buildCategories(String email) => [
        CategoryModel(
          category: 'Фильмы',
          email: email,
        ),
        CategoryModel(
          category: 'Цветы',
          email: email,
        ),
        CategoryModel(
          category: 'Свидания',
          email: email,
        ),
        CategoryModel(
          category: 'Подарки',
          email: email,
        ),
        CategoryModel(
          category: 'Рестораны',
          email: email,
        ),
      ];
}
