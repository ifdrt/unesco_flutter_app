part of 'home_bloc_b.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();

  @override
  List<Object> get props => [];
}

class GetHomeData extends HomeBlocEvent {
  GetHomeData() : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GetImage extends HomeBlocEvent {
  GetImage() : super();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
