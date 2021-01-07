import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';

class TopAppBar extends StatelessWidget {
  final String title;
  final IconButton navIcon;

  const TopAppBar({Key key, @required this.title, this.navIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kWidth = MediaQuery.of(context).size.width;
    return Container(
      width: kWidth,
      height: kToolbarHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// first part -> menu icon & title
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              navIcon ??
                  IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
              Text(
                title,
                style: TextStyle(),
              ),
            ],
          ),

          /// second part -> action buttons
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
