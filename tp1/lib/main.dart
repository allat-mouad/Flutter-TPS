import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> products=[];
  double sum=0;

  TextEditingController controllerProdName=new TextEditingController();
  TextEditingController controllerProdPrice=new TextEditingController();

  void deleteItem(int index){
    if(products.isEmpty){sum=0;}
    sum-=double.parse(products[index].split(" ")[1]);
    products.removeAt(index);
    products.forEach((e) {
      print(e);
    });
  }
  void addItem(){
    if(products.isEmpty){sum=0;}
    products.add(controllerProdName.text+"\nprice: "+controllerProdPrice.text+" \$");
    sum+=double.parse(controllerProdPrice.text);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("e-commerce app"),
        backgroundColor: Colors.greenAccent),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Product name :",
                    style: TextStyle(fontSize: 25, color: Colors.blueAccent)),
                TextField(
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                  controller: controllerProdName,
                  style: TextStyle(fontSize: 30,color: Colors.black),
                ),
                Text("Price :",
                    style: TextStyle(fontSize: 25, color: Colors.blueAccent)),
                TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true,signed: false),

                    decoration: const InputDecoration(border: OutlineInputBorder()),

                  controller: controllerProdPrice,
                  style: TextStyle(fontSize: 30,color: Colors.black),
                )
                ,
                MaterialButton(
                  shape: CircleBorder(),
                    color: Colors.greenAccent,
                    child: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        addItem();
                      });
                    }),
                Expanded(child:ListView.builder(
                    itemCount: products.length,
                    itemBuilder:(BuildContext context,int index){
                      print(index);
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Icon(Icons.add_shopping_cart),
                            backgroundColor: Colors.greenAccent,
                          ),
                          trailing: IconButton(
                              icon:Icon(Icons.delete),
                              onPressed: (){
                                setState(() {
                                  deleteItem(index);
                                });
                              }),
                          title: Text("${products[index]}"),
                        ),);
                    }
                ) ),
                Expanded(
                    child: ListTile(
                          leading: Text("total:",
                              style: TextStyle(fontSize: 25, color: Colors.blueAccent)

                          ),
                          trailing: Text("${sum}\$",
                         style: TextStyle(fontSize: 25, color: Colors.blueAccent)

                 ),
                    )
                    )
              ]
          ),

        ) ,
      ),
    );
  }
}
