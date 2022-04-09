import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListValues extends StatefulWidget{
  @override
  State<ListValues> createState() => _ListValuesState();
}

class _ListValuesState extends State<ListValues> {
  List<int> numbers=[1];

  void addItem(){
    numbers.add(numbers[numbers.length-1]+1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Values"),),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView.builder(
          itemCount: numbers.length,
            itemBuilder: ((context,index)
            {
              return ListTile(
                title: Text("Valeur =>${numbers[index]}"),
              );

            })
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}