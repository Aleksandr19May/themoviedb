import 'package:flutter/material.dart';
import 'package:themoviedb/resource/app_images.dart';


class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemExtent: 163,
      itemBuilder: (BuildContext context, index) {
      return Row(children: [Image(image: AssetImage(AppImages.about_movie))],);
    });
  }
}