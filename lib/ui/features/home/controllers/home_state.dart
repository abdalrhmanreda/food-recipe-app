part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {}

class GetCategoriesSuccess extends HomeState {}

class GetCategoryMealsSuccess extends HomeState {}

class GetCategorySuccess extends HomeState {}
