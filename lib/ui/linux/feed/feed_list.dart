import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqraa/bloc/feed_bloc.dart';

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state.status == FeedStatus.success) {
          final feedWidgets = state.feeds
              .map((e) => ListTile(
                    title: Text(e.name),
                    onTap: () {},
                  ))
              .toList();
          return ListView(
            children: feedWidgets,
          );
        } else {
          return const Center(
            child: Text("error occurred"),
          );
        }
      },
    );
  }
}
