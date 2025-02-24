import 'package:flutter/material.dart';
import 'screens/pediatrician_list_screen.dart';

void main() {
  runApp(BondTimeApp());
}

class BondTimeApp extends StatelessWidget {
  const BondTimeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BondTime',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PediatricianListScreen(),
    );
  }
}
