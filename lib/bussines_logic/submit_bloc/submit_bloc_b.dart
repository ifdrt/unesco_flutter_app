import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:unesco/data/Model/home_model.dart';
import 'package:unesco/data/dataProvider/api.dart';
part 'submit_bloc_e.dart';
part 'submit_bloc_s.dart';

class SubmitBloc extends Bloc<SubmitBlocEvent, SubmitBlocState> {
  SubmitBloc() : super(SubmitBlocInitial());

  @override
  Stream<SubmitBlocState> mapEventToState(
    SubmitBlocEvent event,
  ) async* {
    try {
      if (event is Submiteport) {
        yield SubmitBlocLoding();

        var data = await API.submitReport(event.report);

        if (data!.statusCode == 200) {
          var result = json.decode(data.body);
          print("3234dff $result");
          if (result['status'] == true) {
            yield SubmitBlocLoaded(status: 1, id: result['report_id']);
          } else {
            yield SubmitBlocLoaded(status: 0, id: null);
          }
        } else {
          //sataus 0 is null data or error parse json
          yield SubmitBlocError(status: 0, msg: ["ss"]);
        }
      } else if (event is SubmitQuestion) {
        yield SubmitBlocLoding();

        var data = await API.submitQuestioin(event.question);

        if (data!.statusCode == 200) {
          var result = json.decode(data.body);
          print("664958 $result");
          if (result['status'] == true) {
            yield SubmitBlocLoaded(status: 2, id: null);
          } else {
            yield SubmitBlocLoaded(status: 3, id: null);
          }
        } else {
          //sataus 0 is null data or error parse json
          yield SubmitBlocError(status: 0, msg: ["ss"]);
        }
      }
    } catch (e) {
      print("3234dff SubmitBlocError load error");
      print("664958 ==$e");
      //status -1 server error
      yield SubmitBlocError(status: -1, msg: const [
        "An error has occured.",
        "Please check your connection and try again"
      ]);
    }
  }
}
