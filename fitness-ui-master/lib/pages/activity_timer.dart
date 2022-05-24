import 'package:fitness_flutter/controller/time_cont_down.dart';
import 'package:fitness_flutter/controller/time_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:percent_indicator/circular_percent_indicator.dart';

class ActivityTimer extends StatelessWidget {
  final String image = 'https://i.pinimg.com/originals/18/38/01/18380168eca39710c8eb2633f9c90c81.jpg';
  final String tag = 'imageHeader';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: OrientationBuilder(builder: (context, orientation) {
          return (MediaQuery.of(context).orientation ==
                  prefix0.Orientation.portrait)
              ? Portrait(image: this.image, tag: this.tag)
              : Landscape(image: this.image, tag: this.tag);
        }),
      ),
    );
  }
}

class Portrait extends StatelessWidget {
  final String image, tag;
  
  final CountdownController _controller =
      new CountdownController(autoStart: true);

  Portrait({@required this.image, @required this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: this.tag,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(
                  this.image,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(0, 0, 0, 0.7),
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          height: size.height - 270.0,
          width: size.width,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Countdown(
                // controller: _controller,
                seconds: 12,
                build: (_, double time) => Text(
                  time.toString(),
                  style: TextStyle(
                    fontSize: 160,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 8
                      ..color = Colors.blue[700],
                  ),
                ),
                interval: Duration(milliseconds: 100),
                onFinished: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('¡El tiempo se ha acabado!'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Landscape extends StatelessWidget {
  final String image, tag;

  Landscape({@required this.image, @required this.tag});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        Container(
          child: Image.network(
            this.image,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          top: 40.0,
          left: 40.0,
          child: Text(
            'Plank',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w900,
              color: Colors.grey[500],
            ),
          ),
        ),
        Positioned(
          top: 80.0,
          left: 40.0,
          child: Text(
            'Next: Push-ups',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: Colors.grey[800],
            ),
          ),
        ),
        Positioned(
            top: 30.0,
            left: size.width - 60.0,
            child: GestureDetector(
                child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      size: 29.0,
                      color: Colors.grey[600],
                    )),
                onTap: () {
                  Navigator.pop(context);
                })),
        Positioned(
            left: 40.0,
            top: size.height - 60.0,
            child: Text(
              '43',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w900,
                color: Colors.grey[500],
              ),
            )),
        Positioned(
            top: size.height - 80.0,
            left: size.width / 2 - 30.0,
            child: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.pause,
                  size: 38.0,
                ))),
        Positioned(
          top: size.height - 80.0,
          left: size.width - 170.0,
          child: Container(
            height: 60.0,
            width: 145.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(360.0),
            ),
            child: Center(
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black87,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
