import 'package:app/View/MyHomeWidget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text("FICHA DE INSPECCION"),
        backgroundColor: const Color(0xff8dc440),
      ),
      body: MyHomeWidget(),
    );
  }
}