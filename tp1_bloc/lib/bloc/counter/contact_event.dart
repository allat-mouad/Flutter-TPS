part of 'contact_bloc.dart';

 class ContactEvent {
  const ContactEvent(String name,int index);
}

class AddContactEvent extends ContactEvent{
  AddContactEvent(String name) : super(name);
}
class DeleteContactEvent extends ContactEvent{
  DeleteContactEvent( {int index}) : super(name);
}

