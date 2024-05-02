import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';
import 'package:iqraa/ui/windows/help_page.dart';
import 'package:iqraa/ui/windows/home_page.dart';
import 'package:iqraa/ui/windows/settings_page.dart';
import 'package:iqraa/ui/windows/shell.dart';

final router = GoRouter(
    initialLocation: "/home",
    routes: [
  ShellRoute(
      builder: (context, state, child) {
        return Shell(
          context: context,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: "/home",
          builder: (context, state) {
            return HomePage();
          },
        ),
        GoRoute(
          path: "/settings",
          builder: (context, state) {
            return const SettingsPage();
          },
        ),
        GoRoute(
          path: "/help",
          builder: (context, state) {
            return const HelpPage();
          },
        )
      ]),
]);

class WindowsApp extends StatelessWidget {
  
  WindowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}
