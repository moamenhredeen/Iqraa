
import 'package:dart_rss/domain/rss_feed.dart';
import 'package:http/http.dart' as http;
import 'package:fluent_ui/fluent_ui.dart';

class HomePage extends StatelessWidget {

  HomePage({super.key});

  var url = Uri.http("https://developer.apple.com/news/releases/rss/releases.rss");
  var text = "";

  @override
  Widget build(BuildContext context) {
    http.get(url).then((response) {
      return response.body;
    }).then((bodyString) {
      final channel = RssFeed.parse(bodyString);
      return channel;
    });

    return const Center(
      child: Text("Welcome to the Home Page"),
    );
  }
}
