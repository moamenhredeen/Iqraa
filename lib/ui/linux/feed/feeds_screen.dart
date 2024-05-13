import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iqraa/bloc/feed_bloc.dart';
import 'package:iqraa/ui/linux/feed/add_feed_dialog.dart';
import 'package:iqraa/ui/linux/feed/feed_list.dart';
import 'package:yaru/yaru.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  final _searchController = TextEditingController();
  final _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocusNode.requestFocus();
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YaruDetailPage(
      appBar: const YaruWindowTitleBar(
        title: Text("Feeds Screen"),
        backgroundColor: Colors.transparent,
        border: BorderSide.none,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: MediaQuery.of(context).size.width >= 1000 ? 2 : 4,
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    focusNode: _searchFocusNode,
                    decoration: const InputDecoration(
                      hintText: "search for a feed",
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      context
                          .read<FeedBloc>()
                          .add(GetFeedsEvent(searchKeyword: value));
                    },
                  ),
                  const SizedBox(height: 10),
                  const Expanded(
                    child: FeedList(),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        backgroundColor: PopupMenuTheme.of(context).color,
        shape: PopupMenuTheme.of(context).shape,
        child: const Icon(YaruIcons.plus),
        onPressed: () => showDialog<AddFeedDialogResult>(
          context: context,
          builder: (context) => const AddFeedDialog(),
        ).then((value) {
          // add the feed to the feed to feed list
          context.read<FeedBloc>().add(AddFeedEvent());
        }),
      ),
    );
  }
}
