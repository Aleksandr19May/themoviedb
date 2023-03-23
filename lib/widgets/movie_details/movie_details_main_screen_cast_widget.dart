import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:themoviedb/resource/app_images.dart';

class MovieDetailsScreenWidget extends StatelessWidget {
  const MovieDetailsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Series Cast',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 250,
            child: Scrollbar(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 20,
                  itemExtent: 120,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.black.withOpacity(0.2)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage(AppImages.actor),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children:const  [
                                     
                                       Text('Стивен Янг',maxLines: 1,),
                                       SizedBox(height: 7,),
                                       Text('Марк Грейс/(озвучка)',maxLines: 4,),
                                       SizedBox(height: 7,),
                                       Text('8 Эпизодов',maxLines: 1,),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child:
                TextButton(onPressed: () {}, child: const Text('Full Cast and Crew')),
          )
        ],
      ),
    );
  }
}
