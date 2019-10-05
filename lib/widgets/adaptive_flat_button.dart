import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
class AdaptiveFlatButton extends StatelessWidget {
  final String text;
  final Function handler;
  AdaptiveFlatButton(this.text, this.handler);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS? CupertinoButton(
      child: Text(text),
      onPressed: handler,

    ) :
    FlatButton(
      child: Text(text),
      onPressed: handler,
      textColor: Theme.of(context).primaryColor,
    );
  }
}
