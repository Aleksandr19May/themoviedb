import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/auth/main%20screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/movie_details/movie_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: AppColors.mainDarkBlue),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.white,
            backgroundColor: AppColors.mainDarkBlue),
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/mainScreen': (context) => const MainScreenWidget(),
        '/mainScreen/movie_details': (context) {
          final id = ModalRoute.of(context)!.settings.arguments;

          if (id is int) {
            return MovieDetailsWidget(
              movieId: id,
            );
          } else {
            return const MovieDetailsWidget(movieId: 0);
          }
        },
      },
      initialRoute: '/auth',
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(body: Text('dsdsd'));
        });
      },
    );
  }
}
