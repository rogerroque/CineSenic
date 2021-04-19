import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Movie {
  String title;
  String categories;
  String imageURL;
  String logo;
  double rating;
  DateTime date;

  Movie({@required this.title,
    @required this.imageURL,
    @required this.logo,
    @required this.rating,
    @required this.date,
    @required this.categories});
}

    // Movie(
    //     title: 'Avengers: Endgame',
    //     imageURL:
    //     'https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_.jpg',
    //     logo: 'assets/images/logos/avengers.png',
    //     rating: 8.5,
    //     date: DateTime(2019),
    //     categories: ' Action, Adventure, Drama'),
    // Movie(
    //     title: 'Once upon a time in Hollywood',
    //     imageURL:
    //     'https://posterposse.com/wp-content/uploads/2019/07/Once-upon-a-time-in-hollywood-Poster-Posse-Hughes.png',
    //     logo: 'assets/images/logos/hollywood.png',
    //     rating: 7.7,
    //     date: DateTime(2019),
    //     categories: 'Drama, Comedy-drama'),
