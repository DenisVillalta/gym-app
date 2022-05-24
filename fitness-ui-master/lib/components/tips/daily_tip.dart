import 'package:flutter/material.dart';

class DailyTip extends StatelessWidget {

  final Map<String, String> element = {
    'title': 'NUNCA TE RINDAS',
    'subtitle': 'A partir del primer mes, cuando nuestro organismo ya se haya adaptado a la actividad física y haya adquirido el hábito, podremos comenzar a aumentar la intensidad en los entrenamientos. Y recuerda, el entrenamiento que comparte el doctor Juan Antonio Corbalán es una referenecia. En función de nuestras circunstancias personales y gustos podemos optar por variar alguno de los componentes del mismo.',
    'image': 'assets/images/tip-1.webp',
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
