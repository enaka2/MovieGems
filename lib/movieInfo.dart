/*
Ethan Nakashima
Project: Movie Gems
movieInfo.dart: The third screen that displays more details about the selected movie.
Flutter SDK 3.5.4
*/

import 'package:flutter/material.dart';

class MovieInfo extends StatelessWidget {

  final int index;
  final String movieTitle;
  final String movieImg;

  static const List<String> movieDirectors = [
    'Damien Chazelle',
    'Christopher Nolan',
    'Tom McGrath',
    'Morgan Spurlock',
    'Brett Ratner',
    'Hayao Miyazaki'
  ];
  static const List<String> movieStars = [
    'Emma Stone • Ryan Gosling',
    'Christian Bale • Heath Ledger',
    'Will Ferrell • Jonah Hill',
    'Niall Horan • Harry Styles • Louis\nTomlinson • Zayn Malik • Liam\nPayne',
    'Jackie Chan • Chris Tucker',
    'Christian Bale • Emily Mortimer'
  ];
  static const List<String> movieDurations = [
    '2h 8m',
    '2h 32m',
    '1h 35m',
    '1h 32m',
    '1h 37m',
    '2h 10m'
  ];

  const MovieInfo(this.index, this.movieTitle, this.movieImg, {Key? key})
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
            title: Text('Movie Info',
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  border: Border.all(
                    color: Colors.amber,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Text(movieTitle,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          height: 1.3
                        )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          image: AssetImage(movieImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Director',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(movieDirectors[index],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text('Stars',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(movieStars[index],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text('Duration',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 8,),
                            Text(movieDurations[index],
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                            // SizedBox(height: 10,),
                          ],
                        )
                      ],
                    )
                  ]
                )
            )
          ),
        )
      )
    );
  }

  Widget info() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        border: Border.all(
          color: Colors.amber,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text('Director',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(movieDirectors[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 20,),
              Text('Stars',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(movieStars[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 20,),
              Text('Duration',
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
              Text(movieDurations[index],
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
              SizedBox(height: 10,),
            ],
          )
        ],
      )
    );
  }
}