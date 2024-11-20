/*
Ethan Nakashima
Project: Movie Gems
movieImage.dart: The second screen that displays the entire image of the selected movie.
Flutter SDK 3.5.4
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieImage extends StatelessWidget {

  final String img;
  final String url;

  const MovieImage(this.img, this.url, {Key? key})
      : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      child:
      Scaffold(
        appBar: AppBar(
          title: Text('Movie Image',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )
          ),
          backgroundColor: Colors.grey[900],
        ),
        body: Center(
          child: Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {_launchUrl(url);},
              child: Image.asset(img)
            )
          ),
        ),
      )
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
