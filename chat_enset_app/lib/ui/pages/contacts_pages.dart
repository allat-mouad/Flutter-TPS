import 'package:chat_enset_app/bloc/contact_event.dart';
import 'package:chat_enset_app/bloc/contact_stat.dart';
import 'package:chat_enset_app/bloc/contact_bloc.dart';
import 'package:chat_enset_app/model/contact_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/buttons-bar.dart';

class ContactPage  extends StatelessWidget{
  const ContactPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Contacts")),
      body:Column(
          children: [
            BlocBuilder<ContactBloc,ContactState>(
                builder: (context, state) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ButtonsBar(),
                  );
                }),
            BlocBuilder<ContactBloc,ContactState>(
              //Pour que le listView ecoute les nouveau state on l'envloppe dans blocBuilder
                builder: (context, state) {
                  if(state.requestState==RequestState.Loading){
                    return CircularProgressIndicator();
                  }else  if(state.requestState==RequestState.Loaded){
                    //ListView dans un expanded
                    return Expanded(
                      child:ListView.builder(
                          itemCount: state.contacts.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              title: Text(state.contacts[index].name),
                            );
                          }
                      )
                    ) ;
                  }
                  else if(state.requestState==RequestState.Error){
                    return Column(
                      children: [
                        Text("${state.errormessage}"),
                      ElevatedButton(onPressed: (){
                           ContactBloc contactBloc=context.read<ContactBloc>();
                        if(contactBloc.lastEvent=="All") {
                        context.read<ContactBloc>().add(
                        LoadAllContactsEvent());
                        }else if(contactBloc.lastEvent=="BDCC") {
                        context.read<ContactBloc>().add(
                        LoadBDCCContactsEvent());
                        }else if(contactBloc.lastEvent=="GLSID") {
                        context.read<ContactBloc>().add(
                        LoadGLSIDContactsEvent());
                        }
                        },child: Text("Reload"))],
                    );
                  }
                  else{
                    return      Center(child: Text("Aucun élément"),) ;
                  }
                }
            )
          ]) ,
    );
  }
}