
import 'package:fluent_ui/fluent_ui.dart';

class WindowsApp extends StatelessWidget {
  const WindowsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: "Ikraa",
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return const Center(child: Text("adskfö"),);
      }   
    );
  }
}