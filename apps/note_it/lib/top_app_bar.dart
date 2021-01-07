import 'package:flutter/material.dart';
import 'package:note_it/constants.dart';

/// Creates an AppBar with options
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
      decoration: BoxDecoration(color: kBackgroundColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// first part -> menu icon & title
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              navIcon == null
                  ? IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {},
                    )
                  : navIcon,
              Text(title),
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
                icon: Icon(Icons.bookmark_outline_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
