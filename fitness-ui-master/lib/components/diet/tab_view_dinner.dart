import 'package:fitness_flutter/components/image_card_with_basic_footer.dart';
import 'package:fitness_flutter/data/dinner.dart';
import 'package:fitness_flutter/models/exercise.dart';
import 'package:flutter/material.dart';

class TabViewDinner extends StatelessWidget {
  final String tabName;

  TabViewDinner({@required this.tabName});

  List<Widget> _renderItem(Size size) {
    return List<Widget>.generate(dinners.length, (index) {
      var tag = dinners[index]['title'] + index.toString();
      Exercise exercise = Exercise(
        image: dinners[index]['image'],
        title: dinners[index]['title'],
        time: dinners[index]['time'],
        difficult: dinners[index]['calories'],
        recipe: dinners[index]['recipe']
      );
      return Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        child: ImageCardWithBasicFooter(
          exercise: exercise,
          tag: tag,
          imageWidth: size.width,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: size.width,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Column(children: this._renderItem(size)),
          ],
        ),
      ),
    );
  }
}