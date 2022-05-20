import '../model/contact_model.dart';

class ContactRepository{
  List<Contact> contacts=[
    Contact(id:1,name:"Ahmed",groupe:"BDCC",profil:"Ahmed"),
    Contact(id:2,name:"Omar",groupe:"BDCC",profil:"Ahmed"),
    Contact(id:3,name:"Samir",groupe:"GLSID",profil:"Ahmed"),
    Contact(id:4,name:"Imane",groupe:"GLSID",profil:"Ahmed"),
    Contact(id:5,name:"Tomas",groupe:"BDCC",profil:"Ahmed"),

  ];
  Future<List<Contact>> allContacts()async{
    var futur=await Future.delayed(Duration(seconds: 1));
    return contacts;
  }
  Future<List<Contact>> contactsByGroup(String group)async {
    var futur=await Future.delayed(Duration(seconds: 1));
    return contacts.where((element) => element.groupe==group).toList();
  }
  }

