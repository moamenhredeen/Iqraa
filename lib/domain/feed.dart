import 'package:equatable/equatable.dart';

import 'domain.dart';

class Feed extends Equatable {
  final int id;
  final String name;
  final Uri uri;
  final FeedType feedType;
  final Category? category;

  Feed(
      {required this.id,
      required this.name,
      required this.uri,
      required this.feedType,
      this.category});

  @override
  List<Object?> get props => [id];
}
