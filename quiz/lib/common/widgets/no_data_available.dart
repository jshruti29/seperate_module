import 'package:flutter/material.dart';

class NoDataAvailable {
  Widget noDataAvailable({required animationGif, required String Message}) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 200,
            width: 200,
            child: Image(
              image: new AssetImage(animationGif),
              fit: BoxFit.contain,
            )),
        SizedBox(height: 25),
        Text(Message, style: TextStyle(fontSize: 22, color: Colors.grey[600] ) , textAlign: TextAlign.center,),
      ],
    ));
  }
}
