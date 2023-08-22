import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';

myAppBar(BuildContext context, String title, {Widget? leading}) => AppBar(
  centerTitle: true,
  title: Text(title, style: const TextStyle(color: MyTheme.backgroundColor, fontSize: 24),),
  leading: leading,
);