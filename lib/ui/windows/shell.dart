import 'package:fluent_ui/fluent_ui.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatefulWidget {

  Widget child;
  BuildContext context;

  Shell({super.key, required this.child, required this.context});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  var topIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationView(

      appBar: NavigationAppBar(
        title: const Text('NavigationView'),
        actions: Column(
          children: [
            IconButton(icon: const Icon(FluentIcons.add), onPressed: (){}),
            IconButton(icon: const Icon(FluentIcons.search), onPressed: (){}),
          ],
        ) 
      ),

      pane: NavigationPane(
        displayMode: PaneDisplayMode.auto,
        selected: topIndex,
        onChanged: (index) {
          setState(() {
            topIndex = index;
          });
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Home'),
            body: const Text("Home body"),
            onTap: () {
              context.go("/home");
            },
          ),
          PaneItemSeparator(),
          PaneItem(
              icon: const Icon(FluentIcons.settings),
              title: const Text("Settings"),
              infoBadge: const InfoBadge(source: Text('8')),
              body: const Text("Settings"),
              onTap: () {
                context.go("/settings");
              }
          ),
        ],
      ),

      paneBodyBuilder: (item, body) {
        return widget.child;
      },

    );
  }
}
