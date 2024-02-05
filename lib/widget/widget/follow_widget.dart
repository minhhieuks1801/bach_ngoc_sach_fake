import 'package:flutter/material.dart';

class FollowWidget extends StatefulWidget {
  const FollowWidget({super.key});

  @override
  State<FollowWidget> createState() => _FollowWidgetState();
}

class _FollowWidgetState extends State<FollowWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Follow',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Follow',
          style: TextStyle(
            fontSize: 38,
          ),
        ),
      ),
    );
  }
}
