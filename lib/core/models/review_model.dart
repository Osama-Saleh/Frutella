import 'package:fruit/core/entities/review_entity.dart';

class ReviewModel {
  String name;
  String image;
  DateTime date;
  int rating;
  String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.date,
    required this.rating,
    required this.reviewDescription,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'date': date.millisecondsSinceEpoch,
      'rating': rating,
      'reviewDescription': reviewDescription,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      name: map['name'] as String,
      image: map['image'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      rating: map['rating'] as int,
      reviewDescription: map['reviewDescription'] as String,
    );
  }
  ReviewEntity toEntity() {
    return ReviewEntity(
        name: name,
        image: image,
        rating: rating,
        date: date,
        reviewDescription: reviewDescription);
  }
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      rating: reviewEntity.rating,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }



}
