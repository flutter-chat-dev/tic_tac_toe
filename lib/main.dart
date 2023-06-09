import 'package:flutter/material.dart';
import 'package:tic_tac_toe/styles/colors.dart';
import 'package:tic_tac_toe/widgets/game_view.dart';
import 'package:tic_tac_toe/widgets/rules.dart';

void main() {
  runApp(const MyApp());
}

/// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Chat Tic-Tac-Toe',
      theme: ThemeData(
        primarySwatch: AppColors.scaffold.primary,
      ),
      home: const MyHomePage(),
    );
  }
}

/// This widget is the home page of your application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  static const String title = 'Flutter-Chat Tic-Tac-Toe';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// A subclass of MyHomePage.
///
/// Builds the home page based on [_game] and [_grid] values.
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(MyHomePage.title),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GameView(),
                  SizedBox(height: 40),
                  GameRulesView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
