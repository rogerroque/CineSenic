import 'package:flutter/material.dart';

class Movie {
  String title;

  String age;

  String categorires;

  String imageURL;

  String logo;

  double rating;

  DateTime date;

  Movie(
      {@required this.title,
      @required this.imageURL,
      @required this.logo,
      @required this.age,
      @required this.rating,
      @required this.date,
      @required this.categorires});
}

final List<Movie> movies = [
  Movie(
      title: 'JOKER',
      imageURL:
          'https://mir-s3-cdn-cf.behance.net/project_modules/1400/c58b4681277211.5cfa6e54a6d3d.jpg',
      logo: 'assets/images/logos/joker.png',
      age: '18+',
      rating: 8.7,
      date: DateTime(2019),
      categorires: 'Crime, Drama, Thriller'),
  Movie(
      title: 'Avengers: Endgame',
      imageURL:
          'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
      logo: 'assets/images/logos/avengers.png',
      age: 'PG-13',
      rating: 8.5,
      date: DateTime(2019),
      categorires: ' Action, Adventure, Drama'),
  Movie(
      title: 'Once upon a time in Hollywood',
      imageURL:
          'https://posterposse.com/wp-content/uploads/2019/07/Once-upon-a-time-in-hollywood-Poster-Posse-Hughes.png',
      logo: 'assets/images/logos/hollywood.png',
      age: 'R',
      rating: 7.7,
      date: DateTime(2019),
      categorires: 'Drama, Comedy-drama'),
];
