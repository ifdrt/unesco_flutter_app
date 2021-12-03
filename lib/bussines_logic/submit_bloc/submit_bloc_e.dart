part of 'submit_bloc_b.dart';

abstract class SubmitBlocEvent extends Equatable {
  const SubmitBlocEvent();

  @override
  List<Object> get props => [];
}

class Submiteport extends SubmitBlocEvent {
  dynamic report;
  Submiteport({required this.report}) : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class SubmitQuestion extends SubmitBlocEvent {
  dynamic question;
  SubmitQuestion({required this.question}) : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
