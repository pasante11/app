import 'package:app/View/TerrainData.dart';
import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class MyHomeWidget extends StatefulWidget {
  MyHomeWidget({Key? key}) : super(key: key);

  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: const EdgeInsets.all(20),
              textColor: Colors.white,
              color: Colour('#00783f'),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TerrainData()),
                );
              },
              child: const Text('NUEVA INSPECCION'),
            ),

            const SizedBox(
              height: 30,
            ),

            RaisedButton(
              padding: const EdgeInsets.all(20),
              textColor: Colors.white,
              color: Colour('#00783f'),
              onPressed: () {
                Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TerrainData()),
                );
              },
              child: const Text('COMPLETAR INSPECCION'),
            ),
          ],
        ),
    );
  }
}