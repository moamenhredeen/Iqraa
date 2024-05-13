import 'package:injectable/injectable.dart';
import 'package:iqraa/domain/domain.dart';
import 'package:iqraa/repository/repository.dart';
import 'package:iqraa/utils/helper_methods.dart';

@module
abstract class FeedRepositoryFactory {
  @lazySingleton
  @dev
  FeedRepository get feedRepository => _FeedRepository();
}

/// Feed Repository Contract
abstract interface class FeedRepository
    implements AbstractRepository<Feed, int> {}

class _FeedRepository implements FeedRepository {
  final _feedList = List.generate(
    100,
    (i) => Feed(
      id: i,
      name: "$i is the index of this item",
      uri: Uri.parse("https://$i.feed.com"),
      feedType: FeedType.rss,
    ),
  );

  @override
  Future<List<Feed>> get() async {
    randomDelay();
    return _feedList;
  }

  @override
  Future<Feed> getById(int id) async {
    randomDelay();
    return _feedList[id];
  }

  @override
  Future<Feed> create(Feed feed) async {
    randomDelay();
    return _feedList[feed.id];
  }

  @override
  Future<Feed> update(Feed feed) async {
    randomDelay();
    return _feedList[feed.id];
  }

  @override
  Future<Feed> remove(int id) async {
    randomDelay();
    return _feedList[id];
  }
}
