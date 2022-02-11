import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget listLoadingWidget(BuildContext context) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[400]!,
    child: ListView.builder(
        itemExtent: 60,
        itemCount: (MediaQuery.of(context).size.height) ~/ 60,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(),
                title: Container(
                  color: Colors.white,
                  height: 10,
                  width: Random().nextDouble(),
                ),
              ),
            ],
          );
        }),
  );
}
