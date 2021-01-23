import 'package:flutter/material.dart';
import 'package:tuunde/app/pages/pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    /// instance of theme
    var kTheme = Theme.of(context);

    /// page dimensions
    var displaySize = MediaQuery.of(context).size;
    var kHeight = displaySize.height;
    var kWidth = displaySize.width;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// top app bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: kWidth,
              height: kHeight * 0.1,
              decoration: BoxDecoration(
                color: kTheme.colorScheme.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.home),
                    color: kTheme.colorScheme.onPrimary,
                    iconSize: 28,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.home),
                    color: kTheme.colorScheme.onPrimary,
                    iconSize: 28,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.home),
                    color: kTheme.colorScheme.onPrimary,
                    iconSize: 28,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    color: kTheme.colorScheme.onPrimary,
                    iconSize: 28,
                    onPressed: () => showSearch(
                      context: context,
                      delegate: AppSearchDelegate(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
