import 'package:flutter/material.dart';
import 'package:iqraa/domain/feed_type.dart';
import 'package:iqraa/ui/default/custom_app_bar.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({super.key});

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  late final TextEditingController _searchController;
  late final TextEditingController _feedNameController;
  late final TextEditingController _feedUriController;
  late final GlobalKey<FormState> _feedFormKey;
  final items = [];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _feedNameController = TextEditingController();
    _feedUriController = TextEditingController();
    _feedFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          children: [
            const Spacer(),
            Expanded(
              flex: MediaQuery.of(context).size.width >= 800 ? 3 : 10,
              child: Column(
                children: [
                  TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'search',
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide.none),
                        filled: true,
                        fillColor: Colors.grey.shade200),
                  ),
                  const SizedBox(height: 25),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) => ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        leading: items[index].feedType == FeedType.rss
                            ? const Icon(Icons.rss_feed)
                            : const Icon(Icons.feed),
                        title: Text(items[index].name),
                        subtitle: Text(items[index].uri.toString()),
                        onTap: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 400,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Form(
                    key: _feedFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              "Add Feed",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                            )
                          ],
                        ),
                        const SizedBox(height: 25),
                        TextFormField(
                          controller: _feedNameController,
                          validator: (value) => value == null || value.isEmpty
                              ? "please enter feed name"
                              : null,
                          decoration: const InputDecoration(
                            hintText: "feed name",
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _feedUriController,
                          validator: (value) => value == null || value.isEmpty
                              ? "please enter feed uri"
                              : null,
                          decoration: const InputDecoration(
                            hintText: "feed uri",
                            border: OutlineInputBorder(),
                            isDense: true,
                          ),
                        ),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          child: const Text("save"),
                          onPressed: () {
                            if (_feedFormKey.currentState!.validate()) {
                              Navigator.pop(context);
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ).then((value) {
            print(value);
          });
        },
      ),
    );
  }
}
