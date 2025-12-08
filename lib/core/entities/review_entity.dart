class ReviewEntity {
   String name;
  String image;
  DateTime date;
  int rating;
  String reviewDescription;
  ReviewEntity({
    required this.name,
    required this.image,
    required this.date,
    required this.rating,
    required this.reviewDescription,
  });
}