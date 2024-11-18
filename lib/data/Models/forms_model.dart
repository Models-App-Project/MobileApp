class FormsModel {
  final String name;
  final int age;
  final String description;
  final String email;
  final double height;
  final double weight;
  final String eyesColor;
  final String hairsColor;
  final double waistline;
  final double bust;
  final double hip;

  FormsModel(
      {required this.name,
      required this.age,
      required this.description,
      required this.email,
      required this.height,
      required this.weight,
      required this.eyesColor,
      required this.hairsColor,
      required this.waistline,
      required this.bust,
      required this.hip});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'description': description,
      'email': email,
      'height': height,
      'weight': weight,
      'eyesColor': eyesColor,
      'hairsColor': hairsColor,
      'waistline': waistline,
      'bust': bust,
      'hip': hip
    };
  }
}
