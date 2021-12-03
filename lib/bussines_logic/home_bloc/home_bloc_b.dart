import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:unesco/data/Model/home_model.dart';
import 'package:unesco/data/Model/imagemodel.dart';
import 'package:unesco/data/dataProvider/Api.dart';
part 'home_bloc_e.dart';
part 'home_bloc_s.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBloc() : super(HomeBlocInitial());

  @override
  Stream<HomeBlocState> mapEventToState(
    HomeBlocEvent event,
  ) async* {
    try {
      if (event is GetHomeData) {
        yield HomeBlocLoding();

        var data = await API.gethomeApi();

        if (data != null) {
          yield HomeBlocLoaded(
              homeModel: data, imageDataMOdel: ImageDataMOdel(dataImage: []));
        } else {
          //sataus 0 is null data or error parse json
          yield HomeBlocError(status: 0, msg: ["ss"]);
        }
      } else if (event is GetImage) {
        yield HomeBlocLoding();

        var data = await API.getImagesTest();

        if (data != null) {
          yield HomeBlocLoaded(homeModel: HomeModel(), imageDataMOdel: data);
        } else {
          //sataus 0 is null data or error parse json
          yield HomeBlocError(status: 0, msg: ["ss"]);
        }
      }
    } catch (e) {
      print("3234dff HomeBlocError load error");
      print("3234dff ==$e");
      //status -1 server error
      yield HomeBlocError(status: -1, msg: [
        "An error has occured.",
        "Please check your connection and try again"
      ]);
    }
  }
}
