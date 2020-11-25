import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String pageTitle;

  const DetailsPage({Key key, this.pageTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "The title is $pageTitle"
        ),
      ),
    );
  }
}
