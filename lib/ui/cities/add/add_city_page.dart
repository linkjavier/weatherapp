import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherflut/data/data_constants.dart';
import 'package:weatherflut/model/city.dart';
import 'package:weatherflut/ui/cities/ui_constants.dart';
import 'package:weatherflut/ui/common/debouncer.dart';
import 'package:weatherflut/ui/common/header_widget.dart';
import 'package:http/http.dart' as http;

class AddCityPage extends StatefulWidget {
  @override
  _AddCityPageState createState() => _AddCityPageState();
}

class _AddCityPageState extends State<AddCityPage> {
  Debouncer _debouncer;
  List<City> _cities;

  @override
  void initState() {
    super.initState();
    _debouncer = Debouncer();
    _cities = <City>[];
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer?.dismount();
  }

  void onChangedText(String text) {
    _debouncer.run(() {
      requestSearch(text);
    });
  }

  void requestSearch(String text) async {
    final url = '${api}search/?query=$text';
    final response = await http.get(url);
    final data = jsonDecode(response.body) as List;
    setState(() {
      _cities = data.map((e) => City.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderWidget(
              title: 'Add City',
            ),
            const SizedBox(
              height: 15,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: TextField(
                onChanged: onChangedText,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    filled: true,
                    hintText: 'Search City',
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _cities.length,
                itemBuilder: (context, index) {
                  final city = _cities[index];
                  return ListTile(
                    title: Text(city.title),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.add,
                        color: primaryColor,
                      ),
                      onPressed: () => print(city.title),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
