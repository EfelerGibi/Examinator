import 'package:flutter/material.dart';

class PageWrapper extends StatelessWidget {
  final Widget child;
  final double padding;

  const PageWrapper({Key? key, required this.child, this.padding = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(-1.0, -1),
              end: Alignment(-1.0, 1),
              colors: [
                Color(0xFF3366FF),
                Color(0xFF00CCFF),
              ],
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Container(child: child),
        ));
  }
}

class CardWrapper extends StatelessWidget {
  final Widget child;
  final double padding;
  final Color color;
  final double outerPadding;
  final bool infHeight;
  const CardWrapper(
      {Key? key,
      this.infHeight = true,
      this.outerPadding = 16.0,
      required this.child,
      required this.padding,
      this.color = const Color(0xFF424242)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (infHeight) {
      return Padding(
          padding: EdgeInsets.all(outerPadding),
          child: Container(
              height: double.infinity,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: const Color(0xFF424242).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ], color: color, borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: child,
              )));
    } else {
      return Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
              // alignment: Axis.vertical,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: const Color(0xFF424242).withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ], color: color, borderRadius: BorderRadius.circular(16)),
              width: double.infinity,
              child: Padding(padding: EdgeInsets.all(padding), child: child)));
    }
  }
}
