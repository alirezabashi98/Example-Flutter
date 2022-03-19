import 'package:flutter/material.dart';

goToPage(BuildContext context,Widget Page){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => Page,
    ),
  );
}