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
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                            // blurStyle: BlurStyle.normal,
                            // spreadRadius: 8,
                            offset: const Offset(0, 2))
                      ]),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          const Image(image: AssetImage(AppImages.about_movie)),
                          SizedBox(width: 15,),
                          Expanded
                          (
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: const  [
                                SizedBox(height: 20,),
                                Text('Одни из нас',style: TextStyle(fontWeight: FontWeight.bold),),
                                SizedBox(height: 5,),
                                Text('15 марта 2023 года',style: TextStyle(color: Colors.grey),),
                                SizedBox(height: 20,),
                                Text(
                                    'Закалённый в борьбе за выживание Джоэл и Элли — отважная, не по годам смышлёная девушка-подросток — вынуждены объединиться и помогать друг другу в странствиях по руинам Соединённых Штатов.', maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    ),
                              ],
                            ),
                          )
                        ],
                      ))));
        });
  }
}
