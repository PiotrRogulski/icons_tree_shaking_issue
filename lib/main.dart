import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var _filled = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: .min,
            children: [
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  // The non-animated variant also has the same issue
                  // for (final icon in _icons)
                  //   Icon(icon, size: 96, fill: _filled ? 1 : 0),
                  for (final icon in _icons)
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: _filled ? 1 : 0),
                      curve: Curves.easeInOutCubicEmphasized,
                      duration: Durations.long4,
                      builder: (context, value, _) {
                        return Icon(icon, size: 96, fill: value);
                      },
                    ),
                ],
              ),
              ElevatedButton(
                onPressed: () => setState(() => _filled = !_filled),
                child: const Text('Toggle fill'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _icons = [
  // accountBox
  IconData(0xE851, fontFamily: 'Material Symbols Rounded'),
  // devices
  IconData(0xE326, fontFamily: 'Material Symbols Rounded'),
  // doorFront
  IconData(0xEFFD, fontFamily: 'Material Symbols Rounded'),
  // documentScanner
  IconData(0xE5FA, fontFamily: 'Material Symbols Rounded'),
];
