import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/apikey/api.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/top_movieslider.dart';
import 'package:movieapp/widgets/trending_movieslider.dart';
import 'package:movieapp/widgets/upcoming_movieslider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          "assets/flutflix.png",
          fit: BoxFit.cover,
          height: 40,
          filterQuality: FilterQuality.high,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Trending Movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 15),

            SizedBox(
              child: FutureBuilder(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return Trendingmovieslider(snapshot: snapshot);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            SizedBox(height: 38),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Top rated movies",
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 20),

            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return Topratedmovieslider(snapshot: snapshot);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            SizedBox(height: 38),
            Row(
              children: [
                SizedBox(width: 10),
                Text(
                  'Upcoming movies',
                  style: GoogleFonts.aBeeZee(fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: 20),

            SizedBox(
              child: FutureBuilder(
                future: upComingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else if (snapshot.hasData) {
                    return UpcomingMovieslider(snapshot: snapshot);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
