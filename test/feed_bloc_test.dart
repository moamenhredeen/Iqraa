import 'package:iqraa/bloc/feed_bloc.dart';
import 'package:iqraa/domain/domain.dart';
import 'package:iqraa/repository/feed_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

final fakeFeed = Feed(
  id: 1,
  name: "feed",
  category: Category(id: 1, name: "category"),
  uri: Uri.parse("https://feed.com"),
  feedType: FeedType.rss,
);

class FakeFeedRepository extends Fake implements FeedRepository {
  @override
  Future<List<Feed>> get() async => [fakeFeed];
}

void main() {
  group(FeedBloc, () {
    late FeedBloc feedBloc;

    setUp(() {
      feedBloc = FeedBloc(FakeFeedRepository());
    });

    tearDown(() {
      feedBloc.close();
    });

    test("the initial state should be empty list", () {
      expect(feedBloc.state.status, FeedStatus.success);
      expect(feedBloc.state.feeds, []);
    });

    blocTest(
      'the fetching the feeds should return the whole feed list',
      build: () => feedBloc,
      act: (bloc) => bloc.add(GetFeedsEvent()),
      expect: () => [
        FeedState(feeds: [fakeFeed], status: FeedStatus.success)
      ],
    );
  });
}
