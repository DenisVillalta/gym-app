import 'package:flutter/material.dart';

class DailyTipTres extends StatelessWidget {

  final Map<String, String> element = {
    'title': 'NO te quemes',
    'subtitle': 'Estiramiento (unos 10-15 minutos): para que el cuerpo vuelva a la calma y se recupere con la mayor celeridad, realizaremos unos ejercicios de estiramiento lentos y suaves para relajar los músculos y evitar lesiones. \n\n\n\n\n',
    'image': 'assets/images/tip-3.webp',
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width * 0.80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: width,
          height: 200.0,
          margin: EdgeInsets.only(
            right: 15.0,
            bottom: 10.0,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(this.element['image']),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        Text(
          this.element['title'],
          style: TextStyle(fontSize: 14.0),
        ),
        Container(
          width: width,
          margin: EdgeInsets.only(top: 10.0),
          child: Text(
            this.element['subtitle'],
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14.0,
            ),
          ),
        ),
      ],
    );
  }
}
