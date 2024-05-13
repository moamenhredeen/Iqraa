import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Shell extends StatefulWidget {
  Widget child;

  Shell({super.key, required this.child});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  late int _selectedIndex;
  final int _breakSize = 800;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          selectedIconTheme: Theme.of(context).iconTheme.copyWith(
                color: Colors.blueGrey,
              ),
          selectedLabelTextStyle:
              Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: Colors.blueGrey,
                  ),
          selectedIndex: _selectedIndex,
          labelType: NavigationRailLabelType.all,
          onDestinationSelected: (value) => _navigate(value),
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: Text("Home"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.list_alt_outlined),
              selectedIcon: Icon(Icons.list_alt),
              label: Text("Feeds"),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings_outlined),
              selectedIcon: Icon(Icons.settings),
              label: Text("Settings"),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        Expanded(child: widget.child)
      ],
    );
  }

  void _navigate(int navigationItemIndex) {
    setState(() {
      _selectedIndex = navigationItemIndex;
      var path = switch (navigationItemIndex) {
        0 => '/home',
        1 => '/feeds',
        2 => '/settings',
        _ => throw UnimplementedError(),
      };
      context.push(path);
    });
  }
}
