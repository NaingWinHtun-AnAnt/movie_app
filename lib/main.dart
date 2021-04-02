import 'package:flutter/material.dart';
import 'package:movie_app/network/agents/dio_movie_data_agent_impl.dart';
import 'package:movie_app/network/agents/http_movie_data_agent_impl.dart';
import 'package:movie_app/network/agents/retrofit_data_agent_impl.dart';
import 'package:movie_app/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
