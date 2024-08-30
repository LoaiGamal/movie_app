import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/movieDetails.dart';
import 'package:movie_app/translations/locale_keys.g.dart';
import 'package:movie_app/widgets/rating.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.id});

  final int id;

  @override
  State<DetailsScreen> createState() {
    return _DetailsState();
  }
}

class _DetailsState extends State<DetailsScreen> {
  bool _isLoading = true;
  final _apiUrl = 'https://api.themoviedb.org/3/movie';
  final _apiKey = '15e055caa208cab4ce3a30c8d5ac4a1a';
  MovieDetails _movieDetails = MovieDetails(
      false,
      {},
      0,
      [],
      'homepage',
      0,
      'imdbId',
      [],
      'originalTitle',
      0,
      'posterPath',
      [],
      [],
      0,
      0,
      [],
      'status',
      'tagline',
      false,
      0,
      backdropPath: 'backdropPath',
      originalLanguage: 'originalLanguage',
      overview: 'overview',
      releaseDate: 'releaseDate',
      title: 'title',
      voteAverage: 0);

  void getMovieByID() async {
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('$_apiUrl/${widget.id}?api_key=$_apiKey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        _movieDetails = MovieDetails.fromJson(jsonDecode(response.body));
        _isLoading = false;
      });
      print(_movieDetails);
    } else {
      throw Exception('No Movie Found');
    }
  }

  @override
  void initState() {
    super.initState();
    getMovieByID();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.all(8),
              child: SafeArea(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      movieCover(
                          'https://image.tmdb.org/t/p/w500${_movieDetails.backdropPath}'),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Expanded(
                            child: movieTitle(context, _movieDetails.title!),
                          ),
                          rating(context,
                              _movieDetails.voteAverage!.toStringAsFixed(1)),
                        ],
                      ),
                      const SizedBox(height: 15.0),
                      overview(context),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: movieOverview(
                          context,
                          _movieDetails.overview!,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(color: Color.fromARGB(90, 255, 255, 255)),
                      movieLanguageDetails(context,
                          ' ${_movieDetails.originalLanguage!.toUpperCase()}'),
                      movieDateRelease(
                          context, ' ${_movieDetails.releaseDate!}'),
                      // suggestedMovieList(dummyData),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Image movieCover(String destination) {
    return Image.network(
      destination,
      height: 250,
      fit: BoxFit.cover,
    );
  }

  Text movieTitle(BuildContext context, String title) {
    return Text(
      title,
      maxLines: 3,
      style: Theme.of(context).textTheme.titleLarge!,
    );
  }

  Text overview(BuildContext context) {
    return Text(
      LocaleKeys.overview.tr(),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }

  Text movieOverview(BuildContext context, String overview) {
    return Text(
      overview,
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Row movieLanguageDetails(BuildContext context, String movieLanguage) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.original_language.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          movieLanguage,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }

  Row movieDateRelease(BuildContext context, String dateRelease) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.release_date.tr(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          dateRelease,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
