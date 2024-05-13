import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:iqraa/bloc/feed_bloc.dart';
import 'package:iqraa/ui/linux/article/articles_screen.dart';
import 'package:iqraa/ui/linux/feed/feeds_screen.dart';

import 'settings/settings_page.dart';
import 'shell.dart';

final _getIt = GetIt.instance;
final router = GoRouter(
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: "/articles",
          builder: (context, state) => const ArticlesScreen(),
        ),
        GoRoute(
          path: "/feeds",
          builder: (context, state) => BlocProvider(
            create: (_) => _getIt.get<FeedBloc>()..add(GetFeedsEvent()),
            child: const FeedsScreen(),
          ),
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) => const SettingsPage(),
        ),
      ],
      builder: (context, state, child) => Shell(child: child),
    )
  ],
  initialLocation: "/feeds",
);
