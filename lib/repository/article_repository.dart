import 'package:injectable/injectable.dart';
import 'package:iqraa/domain/domain.dart';
import 'package:iqraa/utils/helper_methods.dart';

import 'repository.dart';

@module
abstract class ArticleRepositoryFactory {
  @lazySingleton
  @dev
  ArticleRepository get articleRepository => _ArticleRepository();
}

abstract interface class ArticleRepository
    implements AbstractRepository<Article, int> {}

class _ArticleRepository implements ArticleRepository {
  @override
  Future<List<Article>> get() async {
    randomDelay();
    return [
      Article(
        id: 0,
        title: "first article title",
        content: "first article content",
      ),
      Article(
        id: 1,
        title: "second article title",
        content: "second article content",
      ),
      Article(
        id: 2,
        title: "third article title",
        content: "third article content",
      ),
    ];
  }

  @override
  Future<Article> getById(int id) async {
    randomDelay();
    return Article(
      id: id,
      title: "article number $id",
      content: "article number $id content",
    );
  }

  @override
  Future<Article> create(Article entity) async {
    randomDelay();
    return Article(
      id: 2,
      title: "third article title",
      content: "third article content",
    );
  }

  @override
  Future<Article> update(Article entity) async {
    randomDelay();
    return Article(
      id: 2,
      title: "third article title",
      content: "third article content",
    );
  }

  @override
  Future<Article> remove(int id) async {
    randomDelay();
    return Article(
      id: 2,
      title: "third article title",
      content: "third article content",
    );
  }
}
