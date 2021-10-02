import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterassignment/Search/bloc/movie_bloc.dart';
import 'package:provider/provider.dart';
import 'Search/ui/search.dart';
import 'data/movie_repository.dart';

void main() => runApp(MultiProvider(providers: [
      RepositoryProvider(create: (context) => MovieRepository()),
      BlocProvider(
          create: (context) =>
              MovieBloc(RepositoryProvider.of<MovieRepository>(context))),
    ], child: MyApp()));
