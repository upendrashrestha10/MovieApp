import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/apikey/constants.dart';
import 'package:movieapp/models/movie.dart';
import 'package:movieapp/widgets/colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: Container(
              height: 70,
              width: 70,
              margin: EdgeInsets.only(top: 16, left: 16),
              decoration: BoxDecoration(
                color: Colours.scaffoldBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_rounded),
              ),
            ),
            backgroundColor: Colours.scaffoldBgColor,
            expandedHeight: 500,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24),
                    ),
                    child: Image.network(
                      '${Constants.imagePath}${movie.backDropPath}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black87, Colors.transparent
                        ]
                      )
                    ),
                    ),
                  
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Overview",
                  style: GoogleFonts.openSans(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 10,),
                Text(movie.overview,
                  style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text("Release date: ",
                            style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),),
                            Text(movie.releaseDate,style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Text("Rating: ",style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),),
                            Icon(Icons.star, color: Colors.amber,),
                            Text("${movie.voteAverage.toStringAsFixed(1)}/10",style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.bold),)
                          ],
                        ),
                        )
                    ],
                  ),
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
