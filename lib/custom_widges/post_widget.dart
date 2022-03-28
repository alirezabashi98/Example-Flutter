import 'package:flutter/material.dart';

Widget getBlogPost(String image) => Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Image(
            image: AssetImage(image),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'سیگنال خرید SafeMoon : برای 14 آبان',
          textDirection: TextDirection.rtl,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'فروش رویه : 12،658',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.price_check,
              size: 20,
              color: Colors.red,
            ),
            SizedBox(
              width: 25,
            ),
            Text(
              'خرید رویه : 12،465',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: Colors.green,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.sell,
              size: 20,
              color: Colors.green,
            ),
          ],
        ),
        Container(
          width: 200,
          child: Divider(
            color: Colors.black,
            thickness: 1,
          ),
        ),
      ],
    );
