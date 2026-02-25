import 'package:flutter/material.dart';
import 'package:long_neck_duck3/core/services/services.dart';
import 'package:long_neck_duck3/ui/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  final Size size = Size(520, 520);

  final WindowOptions windowOptions = WindowOptions(
    alwaysOnTop: true,
    center: true,
    size: size,
    minimumSize: size,
    maximumSize: size,
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setMaximizable(false);
  });
  runApp(const LongNeckDuckyApp());
}

class LongNeckDuckyApp extends StatelessWidget {
  const LongNeckDuckyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LongNeckDuckProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Long Neck Duck',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: HomePage(),
      ),
    );
  }
}
