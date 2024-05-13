import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yaru/yaru.dart';

class Shell extends StatefulWidget {
  Widget child;

  Shell({super.key, required this.child});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  final List<_TileItem> _tileItems = [
    _TileItem(title: 'Articles', icon: Icons.article, path: "/articles"),
    _TileItem(title: 'Feed list', icon: Icons.rss_feed, path: "/feeds"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YaruMasterDetailPage(
      length: _tileItems.length,
      tileBuilder: (context, index, selected, availableWidth) => YaruMasterTile(
        key: Key("tile-item-$index"),
        leading: Icon(_tileItems[index].icon),
        title: Text(_tileItems[index].title),
        onTap: () {
          context.push(_tileItems[index].path);
        },
      ),
      pageBuilder: (context, index) => widget.child,
      bottomBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: YaruMasterTile(
          leading: const Icon(YaruIcons.gear),
          title: const Text('Settings'),
          onTap: () {
            context.go("/settings");
          },
        ),
      ),
    );
  }
}

class _TileItem {
  final String title;
  final String path;
  final IconData icon;
  bool selected;

  _TileItem(
      {required this.title,
      required this.path,
      required this.icon,
      this.selected = false});
}
