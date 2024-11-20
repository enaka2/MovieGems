/*
Ethan Nakashima
Project: Movie Gems
Description: This app displays information about my favorite movies.
main.dart: This file contains the main homepage that shows a list of movies.
Flutter SDK 3.5.4
*/

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'movieImage.dart';
import 'movieInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.black
      ),
      home: const MyHomePage(title: 'Movie Gems'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> movieImgs = [
    'images/lalaland.png',
    'images/darkknight.png',
    'images/megamind.png',
    'images/onedirection.png',
    'images/rushhour.png',
    'images/howls.png'
  ];
  List<String> movieTitles = [
    'La La Land',
    'The Dark Knight',
    'Megamind',
    'One Direction: This Is Us',
    'Rush Hour',
    'Howl\'s Moving Castle'
  ];
  List<String> movieInfos = [
    'Romance/Musical • Damien Chazelle • 2016',
    'Action • Christopher Nolan • 2008',
    'Comedy • Tom McGrath • 2010',
    'Documentary • Morgan Spurlock • 2013',
    'Action/Comedy • Brett Ratner • 1998',
    'Adventure • Hayao Miyazaki • 2004'
  ];
  List<String> movieUrls = [
    'https://www.imdb.com/title/tt3783958/',
    'https://www.imdb.com/title/tt0468569/',
    'https://www.imdb.com/title/tt1001526/',
    'https://www.imdb.com/title/tt2515086/',
    'https://www.imdb.com/title/tt0120812/',
    'https://www.imdb.com/title/tt0347149/'
  ];
  List<String> movieWikis = [
    'https://en.wikipedia.org/wiki/La_La_Land',
    'https://en.wikipedia.org/wiki/The_Dark_Knight_(film)',
    'https://en.wikipedia.org/wiki/Megamind',
    'https://en.wikipedia.org/wiki/One_Direction:_This_Is_Us',
    'https://en.wikipedia.org/wiki/Rush_Hour_(1998_film)',
    'https://en.wikipedia.org/wiki/Howl%27s_Moving_Castle_(film)'
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
        backgroundColor: Colors.grey[900],
      ),
      body: Center(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: movieItem,
          separatorBuilder: (BuildContext context, int position)  {
            return const SizedBox( height: 20, width: 0) ;
          },
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
        ),
      ),
    );
  }

  Widget movieItem(BuildContext context, int index) {
    return Card(
      color: Colors.grey[900],
      elevation: 15,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.amber),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            image: AssetImage(movieImgs[index]),
            fit: BoxFit.cover,
          ),
        ),
        title: Text(movieTitles[index],
          style: const TextStyle(
            fontSize: 26.0,
            color: Colors.white,
            height: 1.3
          ),
        ),
        subtitle: Text(movieInfos[index],
          style: const TextStyle(
            fontSize: 15.0,
            color: Colors.white,
          ),
        ),
        onTap: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieImage(movieImgs[index], movieUrls[index])
            ))
        },
        onLongPress: () => {
          showMenu(
            context: context,
            position: RelativeRect.fromLTRB(5, 50, 0, 0), // Adjust as needed
            items: [
              PopupMenuItem(
                value: 'info',
                child: Text('Movie Info'),
              ),
              PopupMenuItem(
                value: 'wiki',
                child: Text('Wikipedia'),
              ),
              PopupMenuItem(
                value: 'imdb',
                child: Text('IMDb'),
              ),
            ],
          ).then((value) {
            if (value == 'info') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MovieInfo(
                        index,
                        movieTitles[index],
                        movieImgs[index],
                      )
                  ));
            } else if (value == 'wiki') {
              _launchUrl(movieWikis[index]);
            } else if (value == 'imdb') {
              _launchUrl(movieUrls[index]);
            }
          })
        },
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
