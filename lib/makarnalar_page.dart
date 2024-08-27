import 'package:flutter/material.dart';

class MakarnalarPage extends StatelessWidget {
  const MakarnalarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAECD6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF2DEBA),
        title: Text(
          "MAKARNALAR",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
