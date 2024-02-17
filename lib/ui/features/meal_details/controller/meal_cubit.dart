import 'package:fast_food/core/api/api_constant.dart';
import 'package:fast_food/core/api/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/MealModel.dart';

part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealInitial());
  static MealCubit get(context) => BlocProvider.of(context);

  MealModel? mealModel;
  void getMealDetails({required String id}) {
    emit(MealLoading());
    DioHelper.getData(url: ApiConstant.mealDetails, query: {
      'i': id,
    })!
        .then((value) {
      mealModel = MealModel.fromJson(value.data['meals'][0]);
      print(mealModel!.strMeal);
      emit(MealLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(MealError());
    });
  }
}
