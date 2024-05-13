import 'package:flutter/material.dart';

class AddFeedDialog extends StatefulWidget {
  const AddFeedDialog({super.key});

  @override
  State<AddFeedDialog> createState() => _AddFeedDialogState();
}

class _AddFeedDialogState extends State<AddFeedDialog> {
  final _nameController = TextEditingController();
  final _nameFocus = FocusNode();
  final _uriController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 500,
        ),
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Add Feed",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  focusNode: _nameFocus,
                  validator: (value) => value == null || value.isEmpty
                      ? "please enter feed name"
                      : null,
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: "Feed name",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  validator: (value) => value == null || value.isEmpty
                      ? "please enter feed uri"
                      : null,
                  controller: _uriController,
                  decoration: const InputDecoration(
                    hintText: "Feed url",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      child: const Text("cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      child: const Text("save"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(
                              context,
                              AddFeedDialogResult(
                                name: _nameController.text,
                                uri: _uriController.text,
                              ));
                          _nameController.clear();
                          _uriController.clear();
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AddFeedDialogResult {
  final String name;
  final String uri;

  AddFeedDialogResult({
    required this.name,
    required this.uri,
  });
}
