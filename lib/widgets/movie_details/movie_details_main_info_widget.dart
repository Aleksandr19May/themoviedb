import 'package:flutter/material.dart';
import 'package:themoviedb/resource/app_images.dart';
import 'package:themoviedb/widgets/auth/main%20screen/main_screen_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _TopPoster(),
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        const _ScoreWidget(),
        const _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverViewWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _Description(),
        ),
        const SizedBox(
          height: 30,
        ),
        const _PeopleWidget(),
      ],
    );
  }

  Text _Description() {
    return const Text(
        'Две подруги застревают на заброшенной 600-метровой вышке в пустыне. Головокружительный триллер о выживании',
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400));
  }

  Text _OverViewWidget() {
    return const Text(
      'Overview',
      style: TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}

class _TopPoster extends StatelessWidget {
  const _TopPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.20,
            image: const AssetImage(AppImages.movieBig)),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(
              height: MediaQuery.of(context).size.height * 0.15,
              image: const AssetImage(AppImages.movieSmall)),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: const TextSpan(children: [
          TextSpan(
              text: 'Смертельная битва',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21)),
          TextSpan(
              text: ' (2021)',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17)),
        ]));
    // Row(children: [Text(''),Text('')],);
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 75, vertical: 10),
        child: Text(
          'R, 04/29/2021 (US) 1h49m Action, Adventure, Thriller, War',
          style: TextStyle(color: Colors.white, fontSize: 16),
          maxLines: 3,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton(onPressed: (){}, child: Row(
          children: const [
            SizedBox(
              width: 60,
              height: 60,
              child: RadialPercentWidget(child: Text('72'), percent: 0.72,  fillColor: Colors.black,
              freeColor: Colors.red,
              lineColor: Colors.yellow, lineWidth: 3),
            ),
            SizedBox(width: 10,),
            Text('User score'),
          ],
        )),
        Container(
          color: Colors.grey,
          width: 2,
          height: 15,
        ),
        TextButton(onPressed: (){}, child: Row(
          children:const  [
            Icon(Icons.play_arrow_outlined),
            Text('Play score'),
          ],
        )),
      ],
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);
    const jobTitle = TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400);

    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Юлия Вишневская', style: nameStyle),
                Text(
                  'Режиссер',
                  style: jobTitle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Юлия Вишневская',
                  style: nameStyle,
                ),
                const Text(
                  'Режиссер',
                  style: jobTitle,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Юлия Вишневская', style: nameStyle),
                Text(
                  'Режиссер',
                  style: jobTitle,
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Юлия Вишневская', style: nameStyle),
                Text(
                  'Режиссер',
                  style: jobTitle,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
