class RecommendedPlaceModel {
  final String image;
  final double rating;
  final String location;

  RecommendedPlaceModel({
    required this.image,
    required this.rating,
    required this.location,
  });
}

List<RecommendedPlaceModel> recommendedPlaces = [
  RecommendedPlaceModel(
    image: "assets/places/img1.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/img2.jpeg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place5.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place4.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place3.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place2.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
  RecommendedPlaceModel(
    image: "assets/places/place1.jpg",
    rating: 4.4,
    location: "St. Regis Bora Bora",
  ),
];