part of 'meal_cubit.dart';

@immutable
abstract class MealState {}

class MealInitial extends MealState {}

class MealLoading extends MealState {}

class MealLoaded extends MealState {}

class MealError extends MealState {}
