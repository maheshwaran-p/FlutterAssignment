import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutterassignment/Search/bloc/movie_bloc.dart';
import 'package:flutterassignment/models/movie_detail_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailView extends StatefulWidget {
  final MovieDetail movieDetail;
  const MovieDetailView({
    Key? key,
    required this.movieDetail,
  }) : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieDetailState)
          return Scaffold(
              body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.height * 1,
                color: Colors.black,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.66,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "${state.movieDetail.Poster}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 350,
                left: 15,
                right: 15,
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.black87,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.height * 1,
                    child: Column(children: [
                      Container(
                        height: 140,
                        width: MediaQuery.of(context).size.height * 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 17, bottom: 10),
                              child: Text(
                                "${state.movieDetail.Title}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800,
                                    fontSize: 23),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Icon(
                                    Icons.star_border,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "${state.movieDetail.Metascore}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0),
                                  child: Icon(
                                    Icons.timelapse_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    "${state.movieDetail.Runtime}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 10),
                                  child: Text(
                                    "${state.movieDetail.Type}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 60.0, top: 10),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white24,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Text(
                                      '${state.movieDetail.Genre}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 23.0, right: 10, bottom: 13, top: 8),
                            child: Text(
                              "${state.movieDetail.Production}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 23.0, bottom: 13),
                            child: Text(
                              "Director: ${state.movieDetail.Director}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 23.0, bottom: 13),
                            child: Text(
                              "Writer: ${state.movieDetail.Writer}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 23.0),
                            child: Text(
                              "Acters: ${state.movieDetail.Actors}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ])),
              ),
              Positioned(
                  top: 30,
                  left: 23,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ))))
            ],
          ));
        return SizedBox(
          height: 0,
          width: 0,
        );
      },
    );
  }
}
