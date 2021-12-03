part of 'news_bloc.dart';

abstract class NewsBlocEvent extends Equatable {
  const NewsBlocEvent();

  @override
  List<Object> get props => [];
}

class GetNewsData extends NewsBlocEvent {
  GetNewsData() : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
