import 'package:flutter/material.dart';

class DailyTipDos extends StatelessWidget {

  final Map<String, String> element = {
    'title': '¡SIEMPRE MANTENTE ACTIVO!',
    'subtitle': 'Calentamiento activo o convencional (al menos 10 minutos de duración): este calentamiento implica el movimiento y la involucración del deportista y ayudará a prepararnos física, fisiológica y psicológicamente, además de ayudarnos a incrementar nuestra elasticidad y a disminuir las posibilidades de sufrir tirones musculares o desgarros. \n',
    'image': 'assets/images/tip-2.webp',
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
