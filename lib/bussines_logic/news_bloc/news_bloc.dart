import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:unesco/data/Model/news_model.dart';
import 'package:unesco/data/dataProvider/Api.dart';
part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsBlocEvent, NewsBlocState> {
  NewsBloc() : super(NewsBlocInitial());

  @override
  Stream<NewsBlocState> mapEventToState(
    NewsBlocEvent event,
  ) async* {
    try {
      if (event is GetNewsData) {
        yield NewsBlocLoding();

        var data = await API.getnewsApi();

        if (data != null) {
          yield NewsBlocLoaded(newsModel: data);
        } else {
          //sataus 0 is null data or error parse json
          yield NewsBlocError(status: 0, msg: ["ss"]);
        }
      }
    } catch (e) {
      print("NewsBlocError load error");
      print(e);
      //status -1 server error
      yield NewsBlocError(status: -1, msg: [
        "An error has occured.",
        "Please check your connection and try again"
      ]);
    }
  }
}
