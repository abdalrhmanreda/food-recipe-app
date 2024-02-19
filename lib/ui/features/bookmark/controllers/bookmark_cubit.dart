import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_food/ui/features/meal_details/model/MealModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bookmark_state.dart';

class BookmarkCubit extends Cubit<BookmarkState> {
  BookmarkCubit() : super(BookmarkInitial());
  static BookmarkCubit get(context) => BlocProvider.of(context);
  void addToBookmark({required MealModel meal}) {
    emit(BookmarkLoaded());
    FirebaseFirestore.instance
        .collection('bookmark')
        .doc(meal.idMeal)
        .set(meal.toJson())
        .then((value) {
      getBookmark();
      emit(BookmarkAdded(
        meal: meal,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(BookmarkError());
    });
  }

  void removeFromBookmark({required MealModel meal}) {
    emit(BookmarkLoaded());
    FirebaseFirestore.instance
        .collection('bookmark')
        .doc(meal.idMeal)
        .delete()
        .then((value) {
      emit(BookmarkRemoved(
        meal: meal,
      ));
      getBookmark();
    }).catchError((error) {
      print(error.toString());
      emit(BookmarkError());
    });
  }

  List<MealModel> bookmarkList = [];
  void getBookmark() {
    bookmarkList = [];
    emit(BookmarkLoading());
    FirebaseFirestore.instance.collection('bookmark').get().then((value) {
      for (var element in value.docs) {
        bookmarkList.add(MealModel.fromJson(element.data()));
      }
      emit(BookmarkLoaded());
    }).catchError((error) {
      print(error.toString());
      emit(BookmarkError());
    });
  }

  void removeAllBookmark() {
    emit(BookmarkLoaded());
    FirebaseFirestore.instance.collection('bookmark').get().then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
      getBookmark();
      emit(RemoveAllBookmark());
    }).catchError((error) {
      print(error.toString());
      emit(BookmarkError());
    });
  }
}
