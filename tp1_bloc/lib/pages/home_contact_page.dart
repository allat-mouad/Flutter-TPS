
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tp1_bloc/bloc/counter/contact_bloc.dart';
import 'package:tp1_bloc/bloc/counter_cubit.dart';

class HomePage extends StatelessWidget{
  TextEditingController textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  context.read<ContactBloc>().add(AddContactEvent(textController.text));

                }, icon: Icon(Icons.add))
              ],
            ),
            Expanded(
              child: BlocBuilder<ContactBloc,ContactState>(
              builder: (context,state) {
                return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      trailing: IconButton(onPressed: () {
                        context.read<ContactBloc>().add(DeleteContactEvent(index: index));

                      }, icon: Icon(Icons.delete)),
                      leading: CircleAvatar(child: Text(
                          state.data[index].substring(0, 1))),
                      title: Text(state.data[index]),
                    );
                  });

              }
            )
            )
          ],
        ),
      ),
    );
  }
}
