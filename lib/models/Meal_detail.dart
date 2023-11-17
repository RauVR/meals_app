class MealDetail{
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String imageUrl;
  final String videoUrl;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;

  MealDetail({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.imageUrl,
    required this.videoUrl,
    required this.ingredient1,
    required this.ingredient2,
    required this.ingredient3,
    required this.ingredient4
  });

  MealDetail.fromJson(Map<String,dynamic>json):
      id=json['idMeal'],
      name=json['strMeal'],
      category=json['strCategory'],
      area=json['strArea'],
      instructions=json['strInstructions'],
      imageUrl=json['strMealThumb'],
      videoUrl=json['strYoutube'],
      ingredient1=json['strIngredient1'],
      ingredient2=json['strIngredient2'],
      ingredient3=json['strIngredient3'],
      ingredient4=json['strIngredient4'];

}


















