import 'package:go_router/go_router.dart';
import 'package:iqraa/ui/default/shell.dart';

import 'home_screen.dart';
import 'feeds_screen.dart';
import 'settings_screen.dart';

var router = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/feeds',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: FeedsScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsScreen()),
        ),
      ],
      builder: (context, state, child) => Shell(
        child: child,
      ),
    ),
  ],
);
