import 'package:flutter/material.dart';

import '../pages/description.dart';

class TV extends StatelessWidget {
  final List tvshows;
  const TV({
    Key? key,
    required this.tvshows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Popular TV shows 🎥',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tvshows.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: tvshows[index]['title'].toString(),
                                  description: tvshows[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      tvshows[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      tvshows[index]['poster_path'],
                                  vote:
                                      tvshows[index]['vote_average'].toString(),
                                  launch_on: tvshows[index]['release_date']
                                      .toString())));
                    },
                    child: Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500' +
                                  tvshows[index]['poster_path'],
                            ))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                              child: Text(
                            tvshows[index]['original_name'] != null
                                ? tvshows[index]['original_name']
                                : 'loading...',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ))
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
