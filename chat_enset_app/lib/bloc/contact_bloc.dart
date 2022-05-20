import 'package:chat_enset_app/bloc/contact_event.dart';
import 'package:chat_enset_app/bloc/contact_stat.dart';
import 'package:chat_enset_app/model/contact_model.dart';
import 'package:chat_enset_app/repositories/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactBloc extends Bloc<ContactEvent,ContactState>{
  ContactRepository contactRepository;
  String lastEvent="";
  ContactBloc(ContactState contactState,this.contactRepository):super(contactState){
    on<ContactEvent>((event, emit)async{
     if(event is LoadAllContactsEvent){
     lastEvent="All";
    emit(ContactState(contacts: [],requestState: RequestState.Loading, errormessage: ""));
   try {
      List<Contact> contacts = await contactRepository.allContacts();
      emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errormessage: ""));
    }catch(e){
  emit(ContactState(contacts: [],requestState: RequestState.Error, errormessage: e.toString()));
  }
  }
   else if(event is LoadBDCCContactsEvent){
    lastEvent="BDCC";
    emit(ContactState(contacts: [],requestState: RequestState.Loading, errormessage: ""));
  try {
    List<Contact> contacts = await contactRepository.contactsByGroup("BDCC");
     emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errormessage: ""));
  }catch(e){
     emit(ContactState(contacts: [],requestState: RequestState.Error, errormessage: e.toString()));
    }
  }

   else if(event is LoadGLSIDContactsEvent){
     lastEvent="GLSID";
    emit(ContactState(contacts: [],requestState: RequestState.Loading, errormessage: ""));
  try {
    List<Contact> contacts = await contactRepository.contactsByGroup("GLSID");
    emit(ContactState(contacts: contacts, requestState: RequestState.Loaded, errormessage: ""));
  }catch(e){
    emit(ContactState(contacts: [],requestState: RequestState.Error, errormessage: e.toString()));
  }
  }
  });
  }
}