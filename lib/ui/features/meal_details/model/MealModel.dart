class MealModel {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;
  String? strYoutube;
  List<String?>? ingredients;
  List<String?>? measurements;

  MealModel({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.ingredients,
    this.measurements,
  }) {
    // Initialize lists if they are null
    ingredients ??= [];
    measurements ??= [];
  }

  MealModel.fromJson(Map<String, dynamic> json)
      : idMeal = json['idMeal'],
        strMeal = json['strMeal'],
        strCategory = json['strCategory'],
        strArea = json['strArea'],
        strInstructions = json['strInstructions'],
        strMealThumb = json['strMealThumb'],
        strTags = json['strTags'],
        strYoutube = json['strYoutube'],
        ingredients = List<String?>.generate(
          20,
          (i) => json['strIngredient${i + 1}'] as String?,
        )..removeWhere(
            (ingredient) => ingredient == null || ingredient.isEmpty),
        measurements = List<String?>.generate(
          20,
          (i) => json['strMeasure${i + 1}'] as String?,
        )..removeWhere((measure) => measure == null || measure.isEmpty);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['strTags'] = strTags;
    data['strYoutube'] = strYoutube;
    data['ingredients'] = ingredients;
    data['measurements'] = measurements;
    return data;
  }
}
