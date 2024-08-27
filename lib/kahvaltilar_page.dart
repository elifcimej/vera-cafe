import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vera_cafe/widget.dart';

class KahvaltilarPage extends StatelessWidget {
  KahvaltilarPage({super.key});
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference kahvaltiRef = _firestore.collection('kahvalti-pages');
    return MyScaffold(
      title: 'KAHVALTILAR',
      child: Text(
        '${kahvaltiRef.get()}',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
