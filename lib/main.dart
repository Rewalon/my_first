import 'package:flutter/material.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('Колонки и столбцы')),
        ),
        body: SimpleWidget(),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key key, this.text, this.color, this.width, this.fontSize})
      : super(key: key);

  final String text;
  final Color color;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        color: color,
        height: 100,
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize),
        ));
  }
}

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      textBaseline: TextBaseline.alphabetic,
      textDirection: TextDirection.rtl,
      verticalDirection: VerticalDirection.up,
      children: <Widget>[
        TextWidget(
          color: Colors.limeAccent,
          width: 110,
          text: 'Первый',
          fontSize: 20,
        ),
        TextWidget(
          color: Colors.cyanAccent,
          width: 140,
          text: 'Второй',
          fontSize: 30,
        ),
        TextWidget(
          color: Colors.purpleAccent,
          width: 100,
          text: 'Третий',
          fontSize: 30,
        ),
      ],
    );
  }
}
