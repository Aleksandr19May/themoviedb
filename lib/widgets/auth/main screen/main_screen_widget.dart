import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('Новости'),
          MovieListWidget(),
          const RadialPercentWidget(
            fillColor: Colors.black,
            freeColor: Colors.red,
            lineColor: Colors.yellow,
            percent: 0.72,
            lineWidth: 10,
            child: Text(
              '72%',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation), label: 'Фильмы'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: "Сериалы"),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}

class RadialPercentWidget extends StatelessWidget {
  final Widget child;
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  const RadialPercentWidget(
      {super.key,
      required this.child,
      required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Center(
            child: CustomPaint(
                size: Size(200, 200),
                painter: Example(
                    percent: percent,
                    fillColor: fillColor,
                    lineColor: lineColor,
                    freeColor: freeColor,
                    lineWidth: lineWidth)),
          ),
        ),
        Center(child: child),
      ],
    );
  }
}

class Example extends CustomPainter {
  final double percent;
  final Color fillColor;
  final Color lineColor;
  final Color freeColor;
  final double lineWidth;
  const Example(
      {required this.percent,
      required this.fillColor,
      required this.lineColor,
      required this.freeColor,
      required this.lineWidth});
  @override
  void paint(Canvas canvas, Size size) {

    Rect arcRect = calculateRect(size);

    drawBackground(canvas, size);

    drawFreeSpace(canvas, arcRect);

    drawFilledArc(canvas, arcRect);

    // final paint = Paint();
    //   paint.color = Colors.amber;
    //   paint.isAntiAlias; // улучшает качество картинки, но дает нагрузку на телефон
    //   paint.style = PaintingStyle.stroke; // убирает заливку у рисуемой фигуры, оставляя только обводку.
    // paint.strokeWidth = 5; // отвечает за ширину обводки.
    //   // canvas.drawCircle(Offset(size.width/2, size.height/2), 20, paint);
    //    canvas.drawRect(Offset.zero & Size(80,80), paint);
    //    canvas.drawLine(Offset.zero, Offset(40, 40), paint);
    //    canvas.drawLine(Offset(80,0), Offset(40, 40), paint);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.strokeCap = StrokeCap.round; // скругляет окончание линий
    paint.color = fillColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(arcRect, -pi / 2, pi * 2 * percent, false, paint);
  }

  void drawFreeSpace(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    canvas.drawArc(
        arcRect,
        pi * 2 * percent - (pi / 2), // начальная точка дуги
        pi * 2 * (1 - percent), // длина дуги
        false,
        paint);
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = freeColor;
    paint.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, paint);
  }

  Rect calculateRect(Size size) {
    const linesMargin = 6;
    final offset = lineWidth / 2 + linesMargin;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.height - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
