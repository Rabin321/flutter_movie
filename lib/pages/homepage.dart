import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingmovies = [];
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
    print(trendingresult);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TMDB Movies',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
