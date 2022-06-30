//import 'dart:html';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:app/Models/TerrainDataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TerrainData extends StatefulWidget {
  TerrainData({Key? key}) : super(key: key);

  @override
  State<TerrainData> createState() => _TerrainDataState();
}

class _TerrainDataState extends State<TerrainData> {
  TextEditingController _piControlador = TextEditingController();
   //final String url ="http://127.0.0.1:8000/api/terrenos/53";
  final String url ="http://127.0.0.1:8000/api/terrenos/51";
  //final url ="http://127.0.0.1:8000/api/serviciobusquedad?pi=51&manzana=02";
      
  //LISTA DE TERRENOS
  List<TerrainDataModel> myAllData = [];
  List<String> piLista = [];
  List<String> numloteLista = [];
  List<String> manzanaLista = [];
  List<String> manzanaListaN = [];
   List<String>listaAux = [];
  String? selectedValue;
  String? selectedManzana;
  final TextEditingController _manzanaControlador = TextEditingController();
  Future<TerrainDataModel>? _futureAlbum;

  @override
  void initState() {
    super.initState();
    loadData();
    // loadDataLote(51,02);
    // listas();
  }

  void dispose() {
    _manzanaControlador.dispose();
    _piControlador.dispose();
    super.dispose();
  }

  // void main(List<String> arguments){
  //  //listas
  //  listas();
  // }

  
  
  loadData() async {
  var response = await http.get(Uri.parse(url), headers: {"Aceept": "application/json"});
    if (response.statusCode == 200) {
      String responeBody = response.body;
      var jsonBody = json.decode(responeBody);
      for (var data in jsonBody) {
        myAllData.add(TerrainDataModel(data['pi'], data['manzana'], data['numlote']));
        piLista.add(data['pi']);
        manzanaLista.add(data['manzana']);
            for (var i = 0; i < manzanaLista.length; i++) {
              if (!listaAux.contains(manzanaLista[i])) {
                listaAux.add(manzanaLista[i]);
              }
            }
        numloteLista.add(data['numlote']);
      } 
      setState(() {});
      myAllData.forEach((someData) => print("MANZANA : ${someData.manzana}"));
      //myAllData.forEach((someData) => print("LOTE : ${someData.numlote}"));
    } else {
      print('Something went wrong');
    }
  }

  // loadDataLote(pi, manzana) async{
  //     final response = await http.post(
  //     Uri.parse('http://127.0.0.1:8000/api/serviciobusquedad?'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'pi': pi, 'manzana':manzana
  //     }),
  //   );
  //    if (response.statusCode == 200) {
  //     String responeBody = response.body;
  //     var jsonBody = json.decode(responeBody);
  //     for (var data in jsonBody) {
  //       myAllData.add(TerrainDataModel(data['pi'], data['manzana'], data['numlote']));
  //       numloteLista.add(data['numlote']);
  //     } 
  //     setState(() {});
  //   }
  // }
  // listas() async{
  //   //las listas utilizan corchetes
  //    List<String>listaAux = [];
  //    for (var i = 0; i < manzanaLista.length; i++) {
  //       if (!listaAux.contains(manzanaLista[i])) {
  //          listaAux.add(manzanaLista[i]);
  //       }
  //     }
  //     print(listaAux);
  // }

  @override
  Widget build(BuildContext context) {
    String dateOBDCommand =  DateTime.now().toString();
    DateTime date = DateTime.parse(dateOBDCommand);
    String month = DateFormat('yyyy-MM-dd').format(date);
    String hour = DateFormat('H:m:s').format(date);

   return Scaffold(
      appBar: AppBar(
        title: const Text("FICHA DE INSPECCION"),
        backgroundColor: const Color(0xff8dc440),
      ),
      body: ListView(
            children: [
                 
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                         'Fecha: $month', 
                         style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold
                         ),
                      ),
                    ],
                  
                //   mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //        TextField(
                //         controller: _txtPI,
                //         decoration: const InputDecoration(hintText: 'Enter Title'),
                //       ),
                //       TextField(
                //         controller: _txtPI,
                //         decoration: const InputDecoration(hintText: 'Enter Title'),
                //       ),
                //       TextField(
                //         controller: _txtManzana,
                //         decoration: const InputDecoration(hintText: 'Enter Title'),
                //       ),
                //     ],
              ),
              
            const Card(
                    child: ListTile(
                    //https://pub.dev/packages/grouped_list/example
                      leading: Icon(Icons.account_circle_sharp),
                      title: Text('Nro: 000024'),
                      subtitle: Text('Llenado: Juan Perez')
                      ),
              ),

              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'PI',
                      ),
                      onChanged: (txtPI) {
                          print('First text field: $txtPI');
                          txtPI;
                        },
                    )
                  ],
                ),
              ),
              //

              Container(
                padding: const EdgeInsets.all(15),
                child: DropdownButton<String>(
                    hint: const Text('Manzana'),
                    value: selectedManzana,
                    items: listaAux.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }
                    ).toList(),
                    //  onChanged: onChangedCallbackManzana,
                     onChanged: (newValue){
                      setState(() {
                        selectedManzana = newValue;
                        // print(selectedManzana);
                        // listas();
                        }
                      );
                  },
                ),
              ),
     
              //
               Container(
                padding: const EdgeInsets.all(15),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    isExpanded: true,
                    hint: const Text('Seleccionar Lote'),
                    items: numloteLista.map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                      ),
                    ))
                          .toList(),
                    value: selectedValue,
                    onChanged: onChangedCallbackSearchLote,
                    buttonHeight: 40,
                    buttonWidth: 200,
                    itemHeight: 40,
                    dropdownMaxHeight: 200,
                    searchController: _manzanaControlador,
                    searchInnerWidget: Padding(
                      padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 4,
                      right: 8,
                      left: 8,
                      ),
                      child: TextFormField(
                      controller: _manzanaControlador,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        hintText: 'Buscar un lote...',
                        hintStyle: const TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return (item.value.toString().contains(searchValue));
                    },
                    //This to clear the search value when you close the menu
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                         _manzanaControlador.clear();
                      }
                    },
                  ),
      )
      )
              //
          ]
        )
    );
  }

}



Future<void> onChangedCallbackManzana(String? selectedManzana) async {
    if (selectedManzana != null) {
      selectedManzana = selectedManzana;
      
      //final body = {"id": manzanaLista};
      //final response = await http.post(Uri.parse(url), body: body);
      final  url ="http://127.0.0.1:8000/api/terrenos/51";
      final response = await http.get(Uri.parse(url), headers: {"Aceept": "application/json"});
      print(response.body);
    }
  }

  Future<void> onChangedCallbackSearchLote(String? numlote) async {
    if (numlote != null) {
      numlote = numlote;
      //final body = {"id": manzanaLista};
      //final response = await http.post(Uri.parse(url), body: body);
      final url ="http://127.0.0.1:8000/api/serviciobusquedad?pi=51&manzana=02";
      final body = {"numlote":numlote };
      final response = await http.post(Uri.parse(url), body: body);
      print(response.body);

    }
  }

/*
 Future<void> onChangedCallback(String? item) async {
    if (item != null) {
      currentValue = item;
      final url = "my-api-link";
      final body = {"job_type": item};
      final response = await http.post(Uri.parse(url), body: body);
      print(response.body);
    }
  }
 */
//  Container(
      //   //  margin: EdgeInsets.all(10) ,
      //    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      //     child: Card (
      //       margin: const EdgeInsets.all(10),
           
      //       child: Text( 
      //         'FECHA: $result', 
      //       ),

            // child: Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: const <Widget>[
            //     ListTile(
            //       title: Text(
            //         "Nro: 000024",
            //         style: TextStyle(fontSize: 15),
            //       ),
            //       subtitle: Text('Llenado: Juan Perez'),
            //     ),
            //   ],
            // ),

      //       child: Row(
      //         mainAxisSize: MainAxisSize.min,
      //         children: const <Widget>[
      //           Expanded(
      //             child: ListTile(
      //               title: Text('Nro: 000024'),
      //               subtitle: Text('Llenado: Juan Perez'),
      //             ),
      //           ),
      //         ],
      //       )
            
      //     )
      // ),
      
      // body: Container(                         
      //       margin: const EdgeInsets.fromLTRB(0, 10, 0, 0), 
      //       child: Text(                           
      //         // DateTime.now().toString(),         
      //         // DateFormat.yMMMEd().format(DateTime.now()),        
      //        'FECHA: $result',        
              // style: const TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 15
              // ), 
      //       ),
      //     )