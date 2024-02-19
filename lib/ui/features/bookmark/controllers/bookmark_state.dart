part of 'bookmark_cubit.dart';

@immutable
abstract class BookmarkState {}

class BookmarkInitial extends BookmarkState {}

class BookmarkLoaded extends BookmarkState {}

class BookmarkAdded extends BookmarkState {
  final MealModel meal;

  BookmarkAdded({required this.meal});
}

class BookmarkError extends BookmarkState {}

class RemoveAllBookmark extends BookmarkState {}

class BookmarkRemoved extends BookmarkState {
  final MealModel meal;

  BookmarkRemoved({required this.meal});
}

class BookmarkLoading extends BookmarkState {}
