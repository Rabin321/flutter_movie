import 'package:flutter/material.dart';
import 'package:flutter_movie/utils/toprated.dart';
import 'package:flutter_movie/utils/tv.dart';
import 'package:flutter_movie/utils/upcomingmovies.dart';
import 'package:tmdb_api/tmdb_api.dart';

import '../widgets/trending.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingmovies = [];
  List topratedmovies = [];
  List tv = [];
  List upcomingmovies = [];
  //from the api site https://www.themoviedb.org/settings/api
  final String apikey = 'e27480d6b3883c7ce5f4e315d96af9a0';
  final apitoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMjc0ODBkNmIzODgzYzdjZTVmNGUzMTVkOTZhZjlhMCIsInN1YiI6IjYyNDcxYjQ0YTM0OTExMDA2MzEzOThjYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hIg3v5DVu7a1oGN3Y-zQh_ab6q3lMkrSkk4yFUCKG60';

  @override
  void initState() {
    fetchmovie();
    super.initState();
  }

//function to fetch trending movies from api

  fetchmovie() async {
    TMDB tmdbinfo = TMDB(ApiKeys(apikey, apitoken),
        logConfig: const ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingresult = await tmdbinfo.v3.trending.getTrending();
    Map topratedresult = await tmdbinfo.v3.movies.getTopRated();
    Map tvresult = await tmdbinfo.v3.tv.getPopular();

    Map upcomingresult = await tmdbinfo.v3.movies.getUpcoming();
    // print(trendingresult);

    setState(() {
      trendingmovies = trendingresult['results'];
      topratedmovies = topratedresult['results'];
      tv = tvresult['results'];
      upcomingmovies = upcomingresult['results'];
    });
    print(upcomingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('TMDB Movies',
            style: TextStyle(
                color: Colors.green,
                fontSize: 23.0,
                fontWeight: FontWeight.bold)),
      ),
      body: ListView(
        children: [
          Trendingmovies(
            trending: trendingmovies,
          ),
          Toprated(toprated: topratedmovies),
          const SizedBox(
            height: 10,
          ),
          TV(tvshows: tv),
          UpcomingMovies(upcoming: upcomingmovies),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
