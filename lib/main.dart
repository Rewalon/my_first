import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(ScreenWidget());

class ScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: const Text('PageView Widget')),
        ),
        body: PageViewCustomWidget(),
      ),
    );
  }
}

class PageViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.custom(
      childrenDelegate: SliverChildListDelegate([
        Text('1'),
        Text('2'),
        Text('3'),
      ]),
    );
  }
}

class PageViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
      return Container(
        color: index % 2 == 0 ? Colors.red : Colors.green,
        alignment: Alignment.center,
        child: Text('$index'),
      );
    });
  }
}

class PageViewWidget extends StatelessWidget {
  final PageController controller = PageController(initialPage: 2);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      pageSnapping: true,
      //  physics: BouncingScrollPhysics(),
      //physics: NeverScrollableScrollPhysics(),
      controller: controller,
      onPageChanged: (number) {
        print("Page number $number");
      },
      children: [
        Container(
          color: Colors.red,
          child: Center(
            child: Text('STOP!'),
          ),
        ),
        Container(
          color: Colors.yellow,
          child: Center(
            child: Text('READY!'),
          ),
        ),
        Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'GO!',
                style: TextStyle(fontSize: 40),
              ),
              RaisedButton(
                  child: Text('Reload'),
                  color: Colors.blue,
                  onPressed: () {
                    //controller.jumpToPage(0);
                    controller.animateToPage(1,
                        duration: Duration(seconds: 2),
                        curve: Curves.easeInBack);
                  })
            ],
          ),
        ),
      ],
    );
  }
}

class GridViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.custom(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//        childrenDelegate: SliverChildListDelegate([
//          TextWidget(
//            text: "1",
//          ),
//          TextWidget(
//            text: "2",
//          ),
//          TextWidget(
//            text: "3",
//          ),]));
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return TextWidget(text: '$index');
        }, childCount: 15));
  }
}

class GridViewExtentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final queryData = MediaQuery.of(context);
    print(queryData.size);

    return Container(
        width: 300,
        color: Colors.greenAccent,
        child: GridView.extent(
          maxCrossAxisExtent: 100,
          children: [
            TextWidget(
              text: "1",
            ),
            TextWidget(
              text: "2",
            ),
            TextWidget(
              text: "3",
            ),
            TextWidget(
              text: "4",
            ),
            TextWidget(
              text: "5",
            ),
            TextWidget(
              text: "6",
            ),
          ],
        ));
  }
}

class GridViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return TextWidget(
            text: '$index',
          );
        });
  }
}

class GridViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        //reverse: true,
        children: <Widget>[
          TextWidget(
            text: "1",
          ),
          TextWidget(
            text: "2",
          ),
          TextWidget(
            text: "3",
          ),
          TextWidget(
            text: "4",
          ),
          TextWidget(
            text: "5",
          ),
          TextWidget(
            text: "6",
          ),
          TextWidget(
            text: "7",
          ),
          TextWidget(
            text: "8",
          ),
          TextWidget(
            text: "9",
          ),
          TextWidget(
            text: "10",
          ),
          TextWidget(
            text: "11",
          ),
          TextWidget(
            text: "12",
          ),
          TextWidget(
            text: "13",
          ),
          TextWidget(
            text: "14",
          )
        ]);
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
        child: Text(
          text,
          style: TextStyle(fontSize: 40),
        ));
  }
}

class ListViewCustomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.custom(childrenDelegate:
        SliverChildBuilderDelegate((BuildContext context, int index) {
      return TextWidget(text: "$index");
    }));
  }
}

class ListViewBuilderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
      return TextWidget(text: '$index');
    });
  }
}

class ListViewSeparatedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return TextWidget(
            text: "$index",
          );
        },
        separatorBuilder: (context, index) {
          return Divider(color: Colors.blueAccent);
        },
        itemCount: 20);
  }
}

class SimpleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      // scrollDirection: Axis.horizontal,
      //reverse: true,
      //controller: ScrollController(initialScrollOffset: 100),
      //physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(20),
      children: <Widget>[
        TextWidget(
          text: "1",
        ),
        TextWidget(
          text: "2",
        ),
        TextWidget(
          text: "3",
        ),
        TextWidget(
          text: "4",
        ),
        TextWidget(
          text: "5",
        ),
        TextWidget(
          text: "6",
        ),
        TextWidget(
          text: "7",
        ),
        TextWidget(
          text: "8",
        ),
        TextWidget(
          text: "9",
        ),
        TextWidget(
          text: "10",
        )
      ],
    );
  }
}
