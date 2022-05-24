import 'package:fitness_flutter/components/image_card_with_basic_footer.dart';
import 'package:fitness_flutter/data/snack.dart';
import 'package:fitness_flutter/models/exercise.dart';
import 'package:flutter/material.dart';

class TabViewSnack extends StatelessWidget {
  final String tabName;

  TabViewSnack({@required this.tabName});

  List<Widget> _renderItem(Size size) {
    return List<Widget>.generate(snacks.length, (index) {
      var tag = snacks[index]['title'] + index.toString();
      Exercise exercise = Exercise(
        image: snacks[index]['image'],
        title: snacks[index]['title'],
        time: snacks[index]['time'],
        difficult: snacks[index]['calories'],
        recipe: snacks[index]['recipe']
      );
      return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
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