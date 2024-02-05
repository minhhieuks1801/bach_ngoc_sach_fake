import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hello .....!',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Home',
          style: TextStyle(
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
