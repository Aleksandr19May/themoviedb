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
          Center(
            child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.red)),
                // width: 100,
                // height: 100,
                child: CustomPaint(
                  painter: Example(),
                  size: Size(300, 300),
                )),
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

class Example extends CustomPainter {
  final double percent = 0.25;
  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPainter = Paint();
    backgroundPainter.color = Colors.green;
    backgroundPainter.style = PaintingStyle.fill;
    canvas.drawOval(Offset.zero & size, backgroundPainter);

    final fillPainter = Paint();
    fillPainter.color = Colors.red;
    fillPainter.style = PaintingStyle.stroke;
    fillPainter.strokeWidth = 10;
    canvas.drawArc(Offset(5, 5) & Size(size.width - 10, size.height - 10),
        -pi / 2, pi * 2 * percent, false, fillPainter);

    final freeSpace = Paint();
    freeSpace.color = Colors.yellow;
    freeSpace.style = PaintingStyle.stroke;
    freeSpace.strokeWidth = 10;

    canvas.drawArc(Offset(5, 5) & Size(size.width - 10, size.height - 10),
        pi * 2 * percent - (pi/2), // начальная точка дуги 
        pi * 2 * (1-percent), // длина дуги
         false, freeSpace);

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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
