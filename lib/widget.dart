import 'package:flutter/material.dart';

class MyScaffold extends StatelessWidget {
  final String? title;
  final Widget? child;

  const MyScaffold({super.key, this.title, this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAECD6),
      appBar: AppBar(
        title: Text(
          title ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        backgroundColor: const Color(0xFFF2DEBA),
      ),
      body: child, // child widget'ını Scaffold'un body kısmına ekliyoruz
    );
  }
}


/*
class MyExpanded extends StatelessWidget {
  const MyExpanded({
    super.key,
    required this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Text(text ?? ''));
  }
}
*/
