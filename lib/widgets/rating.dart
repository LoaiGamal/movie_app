import 'package:flutter/material.dart';

Row rating (BuildContext context, String movieRate){
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Icon(
        Icons.star,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      const SizedBox(width: 5),
      Text(
        movieRate,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Colors.white),
      )
    ],
  );
}