import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pesquisa = "";
  int _offSet = 0;

  Future _getGif() async {
    late http.Response response;
    if (_pesquisa == "") {
      response = await http.get(Uri.parse
          ("https://api.giphy.com/v1/gifs/trending?api_key=FsGNRjpZjUohDGYe4vUnh4jYxSTH2eRP&limit=25&rating=g"));
    } else {
      response = await http.get(Uri.parse
          ("https://api.giphy.com/v1/gifs/search?api_key=FsGNRjpZjUohDGYe4vUnh4jYxSTH2eRP&q=$_pesquisa&limit=25&offset=$_offSet&rating=g&lang=en"));
    }
    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();
    _getGif().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
