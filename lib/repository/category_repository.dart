import 'package:injectable/injectable.dart';
import 'package:iqraa/domain/domain.dart';
import 'package:iqraa/utils/helper_methods.dart';

import 'repository.dart';

@module
abstract class CategoryRepositoryFactory {
  @lazySingleton
  @dev
  CategoryRepository get categoryRepository => _CategoryRepository();
}

abstract class CategoryRepository
    implements AbstractRepository<Category, int> {}

class _CategoryRepository implements CategoryRepository {
  @override
  Future<List<Category>> get() async {
    randomDelay();
    return [
      Category(id: 0, name: "first category"),
      Category(id: 1, name: "second category"),
      Category(id: 2, name: "third category"),
    ];
  }

  @override
  Future<Category> getById(int id) async {
    return Category(id: id, name: "category number $id");
  }

  @override
  Future<Category> create(Category entity) async {
    return Category(id: 1, name: "second category");
  }

  @override
  Future<Category> remove(int id) async {
    return Category(id: id, name: "$id category");
  }

  @override
  Future<Category> update(Category entity) async {
    return Category(id: entity.id, name: "${entity.id} category");
  }
}
