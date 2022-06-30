import 'package:app/View/home_page.dart';
import 'package:colour/colour.dart';
import 'package:flutter/material.dart';

class MyCardWidget extends StatefulWidget {
  MyCardWidget({Key? key}) : super(key: key);

  @override
  State<MyCardWidget> createState() => _MyCardWidgetState();
}

class _MyCardWidgetState extends State<MyCardWidget> {
  @override
  Widget build(BuildContext context) {
      return Center(  
      child: Container(  
        width: 300,  
        height: 300,  
        padding: new EdgeInsets.all(5.0),  
        child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(5.0),  
          ),  
          color: Colors.white,  
          elevation: 5,  
          child: Column(  
            mainAxisSize: MainAxisSize.min,  
            children: <Widget>[  
              ButtonBar(  
                children: <Widget>[  
                  RaisedButton(  
                    child: const Text('NUEVA INSPECCION'),  
                    padding: const EdgeInsets.all(50),
                    color: Colour('#00783f'),
                    textColor: Colors.white,
                    onPressed: () {
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomePage()),
                      );
                    },  
                  ),  
                  RaisedButton(  
                    child: const Text('COMPLETAR INSPECCION'), 
                    padding: const EdgeInsets.all(50), 
                    color: Colour('#00783f'),
                    textColor: Colors.white,
                    onPressed: () {
                      print('PANTALLA COMPLETAR');
                    },  
                  ),  
                ],  
              ),  
            ],  
          ),  
        ),  
      )  
    );  
  }
}