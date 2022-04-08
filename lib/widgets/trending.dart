import 'package:flutter/material.dart';

class Trendingmovies extends StatelessWidget {
  final List trending;
  const Trendingmovies({
    Key? key,
    required this.trending,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Trending Movies 🔥',
            style: TextStyle(
                fontSize: 19.0,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            height: 260,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: trending.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    // onTap: () {

                    // } ,
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
                                  trending[index]['poster_path'],
                            ))),
                          ),
                          Container(
                            child: Text(trending[index]['title'] != null
                                ? trending[index]['title']
                                : 'loading'),
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
