import 'package:fitness_flutter/components/Header.dart';
import 'package:fitness_flutter/components/diet/tab_view_base.dart';
import 'package:fitness_flutter/components/diet/tab_view_dinner.dart';
import 'package:fitness_flutter/components/diet/tab_view_lunch.dart';
import 'package:fitness_flutter/components/diet/tab_view_snack.dart';
import 'package:flutter/material.dart';

class Diet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: SafeArea(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              flexibleSpace: Header(
                ' Dieta',
                rightSide: Container(
                  height: 35.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  margin: EdgeInsets.only(right: 20.0),
                ),
              ),
              bottom: TabBar(
                tabs: <Widget>[
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Desayuno',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Almuerzo',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Cena',
                    ),
                  ),
                  Container(
                    height: 30.0,
                    child: Tab(
                      text: 'Aperitivos',
                    ),
                  ),
                ],
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey[400],
                indicatorWeight: 4.0,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Color.fromRGBO(215, 225, 255, 1.0),
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                TabViewBase(
                  tabName: 'Desayuno',
                ),
                TabViewLunch(
                  tabName: 'Almuerzo',
                ),
                TabViewDinner(
                  tabName: 'Cena',
                ),
                TabViewSnack(
                  tabName: 'Aperitivos',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
