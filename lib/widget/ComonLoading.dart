import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonLoading extends StatelessWidget  {
 final double radius = 10.0;
 final double width = 50.0;
 final double height = 50.0;
  const CommonLoading({Key key, }) :
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: this.width,
      height: this.height,
      padding: EdgeInsets.all(12.0),
      decoration:BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(this.radius)),
      ),

      child: CircularProgressIndicator(
        strokeWidth:2.0,
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation(Colors.grey),
      ),
    );
  }

}