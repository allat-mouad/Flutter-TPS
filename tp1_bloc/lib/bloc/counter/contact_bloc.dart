import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial()) {
    on<AddContactEvent>((event, emit) {
      state.data.add();
      emit(ContactState(data: state.data));
    });
    on<DeleteContactEvent>((event, emit) {
    //  emit(CounterState(counterValue: state.counterValue-1));
    });
  }
}
