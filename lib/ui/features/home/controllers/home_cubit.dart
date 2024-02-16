import 'package:fast_food/core/api/api_constant.dart';
import 'package:fast_food/core/api/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/CategoryMealModel.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<String> categories = [];
  List<CategoryMealModel> beef = [];
  List<CategoryMealModel> chicken = [];
  List<CategoryMealModel> breakfast = [];
  List<CategoryMealModel> dessert = [];
  List<CategoryMealModel> vegetarian = [];
  List<CategoryMealModel> goat = [];
  List<CategoryMealModel> lamb = [];
  List<CategoryMealModel> pork = [];
  List<CategoryMealModel> miscellaneous = [];
  List<CategoryMealModel> pasta = [];
  List<CategoryMealModel> seafood = [];
  List<CategoryMealModel> side = [];
  List<CategoryMealModel> starter = [];
  List<CategoryMealModel> vegan = [];

  Future<void> getCategoryMeals({required String category}) async {
    try {
      final value = await DioHelper.getData(
          url: ApiConstant.category, query: {'c': category.toLowerCase()});

      if (category == 'beef') {
        value!.data['meals'].forEach((element) {
          beef.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'chicken') {
        value!.data['meals'].forEach((element) {
          chicken.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'breakfast') {
        value!.data['meals'].forEach((element) {
          breakfast.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'dessert') {
        value!.data['meals'].forEach((element) {
          dessert.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'vegetarian') {
        value!.data['meals'].forEach((element) {
          vegetarian.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'goat') {
        value!.data['meals'].forEach((element) {
          goat.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'lamb') {
        value!.data['meals'].forEach((element) {
          lamb.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'pork') {
        value!.data['meals'].forEach((element) {
          pork.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'miscellaneous') {
        value!.data['meals'].forEach((element) {
          miscellaneous.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'pasta') {
        value!.data['meals'].forEach((element) {
          pasta.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'seafood') {
        value!.data['meals'].forEach((element) {
          seafood.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'side') {
        value!.data['meals'].forEach((element) {
          side.add(CategoryMealModel.fromJson(element));
        });
      }
      if (category == 'starter') {
        value!.data['meals'].forEach((element) {
          starter.add(CategoryMealModel.fromJson(element));
        });
      } else {
        value!.data['meals'].forEach((element) {
          vegan.add(CategoryMealModel.fromJson(element));
        });
      }

      emit(GetCategoryMealsSuccess());
    } catch (error) {
      debugPrint(error.toString());
      emit(HomeError());
    }
  }

  Future<void> getCategories() async {
    emit(HomeLoading());

    try {
      final value = await DioHelper.getData(
          url: ApiConstant.categories, query: {'c': 'list'});
      value!.data['meals'].forEach((element) async {
        final category = element['strCategory'];
        categories.add(category);
      });
      for (var element in categories) {
        await getCategoryMeals(category: element.toLowerCase());
      }
      print(categories);
      emit(GetCategoriesSuccess());
    } catch (error) {
      debugPrint(error.toString());
      emit(HomeError());
    }
  }

  List<CategoryMealModel> getCategoryListForCategory(String category, context) {
    // Convert both category and cases in switch to lowercase for case-insensitive comparison
    switch (category.toLowerCase()) {
      case 'beef':
        return HomeCubit.get(context).beef;
      case 'breakfast':
        return HomeCubit.get(context).breakfast;
      case 'chicken':
        return HomeCubit.get(context).chicken;
      case 'dessert':
        return HomeCubit.get(context).dessert;

      case 'lamb':
        return HomeCubit.get(context).lamb;
      case 'miscellaneous':
        return HomeCubit.get(context).miscellaneous;
      case 'pasta':
        return HomeCubit.get(context).pasta;
      case 'pork':
        return HomeCubit.get(context).pork;
      case 'seafood':
        return HomeCubit.get(context).seafood;
      case 'side':
        return HomeCubit.get(context).side;
      case 'starter':
        return HomeCubit.get(context).starter;
      case 'vegan':
        return HomeCubit.get(context).vegan;
      case 'vegetarian':
        return HomeCubit.get(context).vegetarian;
      case 'goat':
        return HomeCubit.get(context).goat;
      default:
        return [];
    }
  }
}
