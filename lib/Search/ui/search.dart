import 'package:flutter/material.dart';
import 'package:flutterassignment/Search/bloc/movie_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/Search/ui/moviedetail.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read<MovieBloc>().add(LoadOldResponseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: false,
            body: BlocConsumer<MovieBloc, MovieState>(
              listenWhen: (previous, current) {
                if (current is MovieDetailState) return true;
                return false;
              },
              listener: (context, state) {
                if (state is MovieDetailState) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailView(movieDetail: state.movieDetail)));
                }
              },
              buildWhen: (previous, current) {
                if (current is MovieDetailState) return false;
                if (current is DetailLoadingState) return false;
                return true;
              },
              builder: (context, state) {
                if (state is MovieInitial) {
                  return Container(
                      child: Column(children: [
                    SearchBox(),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 90.0, left: 5, right: 5),
                      child: Text(
                        "Your Search Result Will Appear Here!",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]));
                }
                if (state is SearchLoadedState) {
                  return Column(children: [
                    SearchBox(),
                    Container(
                        height: MediaQuery.of(context).size.height * .7,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.0,
                          mainAxisSpacing: 30.0,
                          children: List.generate(state.response.movies.length,
                              (index) {
                            return GestureDetector(
                              onTap: () {
                                context.read<MovieBloc>().add(MovieDetialEvent(
                                    state.response.movies[index].imdbID));
                              },
                              child: Container(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 140,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            //  color: Colors.red[500],
                                            ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              "${state.response.movies[index].Poster}"),
                                          // fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4.0),
                                          child: Text(
                                            "${state.response.movies[index].Title}",
                                            style:
                                                TextStyle(color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.0),
                                          child: Text(
                                            "${state.response.movies[index].Year}",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                        ))
                  ]);
                }
                return SizedBox(
                  width: 0,
                  height: 0,
                );
              },
            )));
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250.0, left: 20, top: 42),
                child: Text(
                  "Browse",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 5),
                child: Text(
                  "Movies",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w100),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 27.0),
            child: Icon(
              Icons.menu_sharp,
              color: Colors.white24,
            ),
          )
        ]),
        Container(
          height: 45,
          margin:
              EdgeInsets.only(left: 5.0, right: 5.0, top: 48.0, bottom: 20.0),
          padding: EdgeInsets.only(left: 20.0),
          decoration: BoxDecoration(
              color: Colors.white10, borderRadius: BorderRadius.circular(.0)),
          child: TextField(
            onChanged: (value) {
              context.read<MovieBloc>().add(SearchMovieEvent(value));
            },
            decoration: InputDecoration(
              hintText: ("Search movies"),
              hintStyle: TextStyle(color: Colors.white24),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white24,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
              ),
            ),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
