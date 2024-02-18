import 'package:fast_food/core/api/api_constant.dart';
import 'package:fast_food/core/api/dio_helper.dart';
import 'package:fast_food/ui/features/meal_details/model/MealModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  var searchController = TextEditingController();

  List<MealModel> searchList = [];
  void searchByLetter({required String query}) {
    searchList = [];
    emit(SearchLoading());
    DioHelper.getData(url: ApiConstant.search, query: {
      'f': query,
    })!
        .then((value) {
      value.data['meals'].forEach((element) {
        searchList.add(MealModel.fromJson(element));
      });
      emit(SearchLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(SearchError());
    });
  }

  void searchByWord({required String query}) {
    searchList = [];
    emit(SearchLoading());
    DioHelper.getData(url: ApiConstant.search, query: {
      's': query,
    })!
        .then((value) {
      value.data['meals'].forEach((element) {
        searchList.add(MealModel.fromJson(element));
      });
      emit(SearchLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(SearchError());
    });
  }
}
