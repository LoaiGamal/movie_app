import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_app/models/base_pagination.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/screens/details_screen.dart';
import 'package:movie_app/translations/locale_keys.g.dart';
import 'package:movie_app/widgets/main_drawer.dart';
import 'package:movie_app/widgets/movie_grid_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.screenName});

  final String screenName;


  @override
  State<MainScreen> createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  bool _isLoading = true;
  List<Movie> movies = [];
  final _apiUrl = 'https://api.themoviedb.org/3/movie';
  final _apiKey = '15e055caa208cab4ce3a30c8d5ac4a1a';
  final _sortedBy = 'popularity.desc';
  int _currentPage = 1;
  String screenName = LocaleKeys.top_rated.tr();

  void _selectedMovie(BuildContext context, int movieID) {
    Navigator.push(
        context, MaterialPageRoute(builder: (ctx) => DetailsScreen(id: movieID,)));
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }



  void getAllData() async {
    _isLoading = true;

    screenName = getScreenName();

    Uri url = Uri.parse(
        '$_apiUrl/$screenName?api_key=$_apiKey&sort_by=$_sortedBy&page=$_currentPage');
    http.Response response = await http.get(url);
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      BasePagination allData = BasePagination.fromJson(jsonDecode(response.body));
      setState(() {
        movies = [...movies, ...allData.movies!];
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load.');
    }
  }

  String getScreenName(){
    if (widget.screenName == LocaleKeys.top_rated.tr()) {
      return 'top_rated';
    } else if (widget.screenName == LocaleKeys.upcoming.tr()) {
      return 'upcoming';
    } else{
      return 'now_playing';
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: CircularProgressIndicator(),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: appBarTitle(context),
      ),
      drawer: const MainDrawer(),
      body: _isLoading
          ? content
          : GridView.builder(
              itemCount: movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.45,
              ),
              itemBuilder: (context, index) {
                if (index == movies.length - 1) {
                  _currentPage++;
                  _isLoading = true;
                  getAllData();
                }
                print(index);
                return MovieGridItem(
                  onSelectedMovie: () {
                    _selectedMovie(context, movies[index].id!);
                    print(movies[index].id);
                  },
                  movie: movies[index],
                );
              },
            ),
    );
  }

  Text appBarTitle(BuildContext context) {
    return Text(
      widget.screenName,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 24,
            color: Colors.white,
          ),
    );
  }
}
