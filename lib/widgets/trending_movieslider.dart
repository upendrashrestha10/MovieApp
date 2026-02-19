import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieapp/Screen/details_screen.dart';
import 'package:movieapp/apikey/constants.dart';

class Trendingmovieslider extends StatelessWidget {
  const Trendingmovieslider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, itemIndex, pageview) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DetailsScreen(movie: snapshot.data[itemIndex]),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          enlargeCenterPage: true,
          pageSnapping: true,
          viewportFraction: 0.50,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: Duration(seconds: 1),
        ),
      ),
    );
  }
}
