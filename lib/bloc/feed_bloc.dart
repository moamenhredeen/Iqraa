import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:iqraa/domain/feed.dart';
import 'package:iqraa/repository/feed_repository.dart';

// ------------------------------------------ events -----------------------------------------

sealed class FeedEvent {}

final class AddFeedEvent extends FeedEvent {}

final class GetFeedsEvent extends FeedEvent {
  final String? searchKeyword;

  GetFeedsEvent({this.searchKeyword});
}

// ------------------------------------------ state -----------------------------------------

enum FeedStatus { success, failure }

final class FeedState extends Equatable {
  final List<Feed> feeds;
  final FeedStatus status;

  const FeedState({required this.feeds, required this.status});

  @override
  List<Object?> get props => [feeds, status];
}

// ------------------------------------------ bloc -----------------------------------------
@injectable
class FeedBloc extends Bloc<FeedEvent, FeedState> {
  late final FeedRepository _feedRepository;

  FeedBloc(FeedRepository feedRepository)
      : super(FeedState(feeds: [], status: FeedStatus.success)) {
    _feedRepository = feedRepository;

    on<GetFeedsEvent>(_getFeeds);
    on<AddFeedEvent>(_addFeed);
  }

  _getFeeds(GetFeedsEvent event, Emitter<FeedState> emit) async {
    log("fetch feeds");
    var feeds = await _feedRepository.get();
    if (event.searchKeyword != null) {
      feeds = feeds
          .where((e) =>
              e.name.toLowerCase().contains(event.searchKeyword!.toLowerCase()))
          .toList();
    }

    emit(FeedState(
      feeds: feeds,
      status: FeedStatus.success,
    ));
  }

  _addFeed(AddFeedEvent event, Emitter<FeedState> emit) async {
    log("an event was added");
    emit(FeedState(
      feeds: await _feedRepository.get(),
      status: FeedStatus.success,
    ));
  }
}
