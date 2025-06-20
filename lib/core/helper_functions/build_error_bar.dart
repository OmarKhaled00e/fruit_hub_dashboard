 import 'package:flutter/material.dart';

void buildBar(BuildContext context, String massage) {
     ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(massage)));
  }
