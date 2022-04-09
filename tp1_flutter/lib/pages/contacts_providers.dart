import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp1_flutter/providers/contacts_state.dart';




class ContactProvider extends StatelessWidget {
  TextEditingController textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("***** build method *****");

    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.contacts),
                        hintText: "Entrez un nom",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)
                        )
                    ),
                    controller: textController,
                  ),
                ),
                IconButton(onPressed: () {

                  Provider.of<ContactState>(context,listen: false).addItem(textController.text);


                }, icon: Icon(Icons.add))
              ],
            ),
            Expanded(
              child: Consumer<ContactState>(

              builder:(context,contactState,child){
                print("***** Consumer *****");

                return ListView.builder(

                itemCount:contactState.data.length ,
                itemBuilder: (context, index) {
                return ListTile(
                leading: CircleAvatar(child: Text(contactState.data[index].substring(0,1))),
                title: Text(contactState.data[index]),
                );
                },
                );
                }
              )
            )
          ],
        ),
      ),
    );
  }
}
