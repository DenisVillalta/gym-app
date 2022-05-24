import 'package:fitness_flutter/components/tips/daily_tip-dos.dart';
import 'package:fitness_flutter/components/tips/daily_tip.dart';
import 'package:fitness_flutter/components/header.dart';
import 'package:fitness_flutter/components/image_card_with_basic_footer.dart';
import 'package:fitness_flutter/components/section.dart';
import 'package:fitness_flutter/components/image_card_with_internal.dart';
import 'package:fitness_flutter/components/main_card_programs.dart';
import 'package:fitness_flutter/components/tips/daily_tip_tres.dart';
import 'package:fitness_flutter/components/user_photo.dart';
import 'package:fitness_flutter/components/user_tip.dart';
import 'package:fitness_flutter/models/exercise.dart';
import 'package:fitness_flutter/pages/activity_detail.dart';
import 'package:fitness_flutter/pages/login_page.dart';

import 'package:flutter/material.dart';

class Programs extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise(
      image: 'assets/images/image001.jpg',
      title: 'Inicio fácil',
      time: '5 min',
      difficult: 'Bajo',
      recipe: '  '
    ),
    Exercise(
      image: 'assets/images/image002.jpg',
      title: 'Inicio medio',
      time: '10 min',
      difficult: 'Medio',
      recipe: '  '
    ),
    Exercise(
      image: 'assets/images/image003.jpg',
      title: 'Inicio dificil',
      time: '25 min',
      difficult: 'Difícil',
      recipe: '  '
    )
  ];

  void cerrarSesion(BuildContext context) {
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context) => new LoginPage()));
  }


  List<Widget> generateList(BuildContext context) {
    List<Widget> list = [];
    int count = 0;
    exercises.forEach((exercise) {
      Widget element = Container(
        margin: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          child: ImageCardWithBasicFooter(
            exercise: exercise,
            tag: 'imageHeader$count',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return ActivityDetail(
                    exercise: exercise,
                    tag: 'imageHeader$count',
                  );
                },
              ),
            );
          },
        ),
      );
      list.add(element);
      count++;
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  title: Text('Programas'),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal
                  ),
                  actions: [
                    MaterialButton(
                        onPressed: () {
                          cerrarSesion(context);
                        },
                        child: new Icon(Icons.logout_outlined, size: 30),
                    )
                  ],
                ),
                MainCardPrograms(), // MainCard
                Section(
                  title: 'Para quemar grasa',
                  horizontalList: this.generateList(context),
                ),
                Section(
                  title: 'Generación de Abs',
                  horizontalList: <Widget>[
                    ImageCardWithInternal(
                      image: 'assets/images/crossfit.jpeg',
                      title: 'Crossfit',
                      duration: '15 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/quemar-grasa.jpeg',
                      title: 'Elíptica',
                      duration: '30 min',
                    ),
                    ImageCardWithInternal(
                      image: 'assets/images/hiit.jpeg',
                      title: 'Entrenamiento HIIT',
                      duration: '5 min',
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  padding: EdgeInsets.only(top: 0.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                  ),
                  child: Column(
                    children: <Widget>[
                      Section(
                        title: 'Tips diarios \n',
                        horizontalList: <Widget>[
                          DailyTip(),
                          DailyTipDos(),
                          DailyTipTres(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}