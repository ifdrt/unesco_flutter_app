part of 'news_bloc.dart';

abstract class NewsBlocState extends Equatable {
  const NewsBlocState();

  @override
  List<Object> get props => [];
}

class NewsBlocInitial extends NewsBlocState {}

class NewsBlocLoding extends NewsBlocState {}

class NewsBlocLoaded extends NewsBlocState {
  late NewsModel newsModel;
  NewsBlocLoaded({required this.newsModel});
}

class NewsBlocError extends NewsBlocState {
  int status;
  List<String> msg;
  NewsBlocError({required this.status, required this.msg});
}
