class Meal{
  final String id;
  final String name;
  final String imageUrl;

  Meal({required this.id, required this.name, required this.imageUrl});

  Meal.fromJson(Map<String,dynamic>json):
        id=json['idMeal'],
        name=json['strMeal'],
        imageUrl=json['strMealThumb'];

  Map<String,dynamic>toMap(){
    return{
      'id':id,
      'name':name,
      'imageUrl':imageUrl,
    };
  }

  Meal.fromMap(Map<String,dynamic>map):
    id=map['id'],
    name=map['name'],
    imageUrl=map['imageUrl'];

}