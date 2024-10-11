import 'package:flutter/material.dart';
import 'package:temp_converter/screens/home_screen.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  // Disable resize
  windowManager.setResizable(false);

  // Disable maximize
  windowManager.setMaximizable(false);

  windowManager.setTitle("Convertisseur de température");

  WindowOptions windowOptions = WindowOptions(
    size: Size(700, 425),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    //titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Convertisseur de température',
      home: HomeScreen(),
    );
  }
}
