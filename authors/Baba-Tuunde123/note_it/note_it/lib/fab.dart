import 'package:flutter/material.dart';

class NoteFAB extends StatefulWidget {
  final IconData icon;
  final bool isLoading;
  final Color backgroundColor;
  final Color iconColor;
  final Function onTap;

  const NoteFAB({
    Key key,
    @required this.icon,
    @required this.onTap,
    this.isLoading = false,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  _NoteFABState createState() => _NoteFABState();
}

class _NoteFABState extends State<NoteFAB> {
  @override
  Widget build(BuildContext context) {
    final kTheme = Theme.of(context);

    return GestureDetector(
      onTap: widget.onTap,
      child: Material(
        type: MaterialType.transparency,
        elevation: 4,
        child: Container(
          height: kToolbarHeight,
          width: kToolbarHeight,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.backgroundColor ?? kTheme.colorScheme.secondary,
          ),
          alignment: Alignment.center,
          child: widget.isLoading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(
                      widget.iconColor ?? kTheme.colorScheme.onSecondary),
                )
              : Icon(
                  widget.icon,
                  color: widget.iconColor ?? kTheme.colorScheme.onSecondary,
                ),
        ),
      ),
    );
  }
}
