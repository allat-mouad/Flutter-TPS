
import '../model/contact_model.dart';

enum RequestState{Loaded, Loading, Error, NONE}
class ContactState{
  List<Contact> contacts;
  RequestState requestState;
  String errormessage;
  ContactState({required this.contacts,required this.requestState,required this.errormessage});
}