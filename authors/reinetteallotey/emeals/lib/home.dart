import 'dart:ui';

import 'package:emeals/details.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var mq = MediaQuery.of(context);
    var kHeight = mq.size.height;
    var kWidth = mq.size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Blurred image background.
          Container(
            height: kHeight,
            width: kWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/restaurants.webp"),
              // image: NetworkImage("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cmVzdGF1cmFudHxlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=600&q=90"),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          //  Content on the background:
          Container(
            height: kHeight,
            width: kWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: kHeight * 0.2),
                Text(
                  "E-meals",
                  style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  "Eat good anywhere.",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white,
                      ),
                ),
                // SizedBox(height: 24),
                Spacer(),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(
                          pageTitle: "hajdhajdhj",
                        ),
                      ),
                    );
                  },
                  child: Text("Explore"),
                ),
                SizedBox(height: kHeight * 0.1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
