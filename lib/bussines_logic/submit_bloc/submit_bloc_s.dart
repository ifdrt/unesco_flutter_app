part of 'submit_bloc_b.dart';

abstract class SubmitBlocState extends Equatable {
  const SubmitBlocState();

  @override
  List<Object> get props => [];
}

class SubmitBlocInitial extends SubmitBlocState {}

class SubmitBlocLoding extends SubmitBlocState {}

class SubmitBlocLoaded extends SubmitBlocState {
  late int status;
  late dynamic id;
  SubmitBlocLoaded({required this.status, required this.id});
}

class SubmitBlocError extends SubmitBlocState {
  int status;
  List<String> msg;
  SubmitBlocError({required this.status, required this.msg});
}
