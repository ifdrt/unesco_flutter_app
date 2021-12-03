part of 'home_bloc_b.dart';

abstract class HomeBlocState extends Equatable {
  const HomeBlocState();

  @override
  List<Object> get props => [];
}

class HomeBlocInitial extends HomeBlocState {}

class HomeBlocLoding extends HomeBlocState {}

class HomeBlocLoaded extends HomeBlocState {
  late HomeModel homeModel;
  late ImageDataMOdel imageDataMOdel;
  HomeBlocLoaded({required this.homeModel, required this.imageDataMOdel});
}

class HomeBlocError extends HomeBlocState {
  int status;
  List<String> msg;
  HomeBlocError({required this.status, required this.msg});
}
