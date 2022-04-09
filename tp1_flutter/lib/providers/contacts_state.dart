
import 'package:flutter/cupertino.dart';

class ContactState extends ChangeNotifier{
  List<String> data=[];

  void addItem(String contact){
    data.add(contact);
    notifyListeners();
  }
}