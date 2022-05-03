import 'package:flutter/material.dart';

GoToScreen(BuildContext context, Widget screen) => Navigator.of(context)
    .push(MaterialPageRoute(builder: (BuildContext context) => screen));
