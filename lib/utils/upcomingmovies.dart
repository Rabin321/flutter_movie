import 'package:flutter/material.dart';

import '../pages/description.dart';

class UpcomingMovies extends StatelessWidget {
  final List upcoming;
  const UpcomingMovies({
    Key? key,
    required this.upcoming,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Upcoming Movies 🎬',
            style: TextStyle(
                fontSize: 22.0,
                color: Colors.white,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 265,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcoming.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: upcoming[index]['title'].toString(),
                                  description: upcoming[index]['overview'],
                                  bannerurl: 'https://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['backdrop_path'],
                                  posterurl: 'https://image.tmdb.org/t/p/w500' +
                                      upcoming[index]['poster_path'],
                                  vote: upcoming[index]['vote_average']
                                      .toString(),
                                  launch_on: upcoming[index]['release_date']
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
                                  upcoming[index]['poster_path'],
                            ))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              upcoming[index]['title'] != null
                                  ? upcoming[index]['title']
                                  : 'loading...',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          )
        ]));
  }
}
