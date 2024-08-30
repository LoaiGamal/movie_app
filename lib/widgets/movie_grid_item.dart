import 'package:flutter/material.dart';
import 'package:movie_app/widgets/rating.dart';
import 'package:movie_app/models/movie.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({super.key, required this.onSelectedMovie, required this.movie});

  final void Function() onSelectedMovie;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectedMovie,
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).highlightColor,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            moviePoster(),
            const SizedBox(height: 10),
            Flexible(
              child: movieTitle(
                context,
                movie.title!,
                // 'Movie Title',
              ),
            ),
            rating(
              context,
              movie.voteAverage!.toStringAsFixed(1),
            ),
          ],
        ),
      ),
    );
  }

  Image moviePoster() {
    return Image.network(
      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      height: 250,
      fit: BoxFit.fill,
    );
  }

  Text movieTitle(BuildContext context, String title) {
    return Text(
      title,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: Colors.white),
    );
  }
}
