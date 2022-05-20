part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final List<String> data;
  const ContactState({ required this.data});

  @override
  // TODO: implement props
  List<Object?> get props  => [data];
}

class ContactInitial extends ContactState {
  ContactInitial() : super(data: []);

  @override
  List<Object> get props => [data];
}
