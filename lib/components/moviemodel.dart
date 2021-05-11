import 'package:flutter/material.dart';

class Movie {
  String title;
  String categories;
  String imageURL;
  String logo;
  double rating;
  DateTime date;
  String director;
  String actor;
  String synopsis;
  double price;
  String videoURL;


  Movie({@required this.title,
    @required this.imageURL,
    @required this.logo,
    @required this.rating,
    @required this.date,
    @required this.categories,
    @required this.director,
    @required this.actor,
    @required this.synopsis,
    @required this.price,
    @required this.videoURL});

}

List<Movie> movies = [];

