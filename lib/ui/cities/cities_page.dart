import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherflut/ui/cities/ui_constants.dart';
import 'package:weatherflut/ui/common/header_widget.dart';

class CitiesPage extends StatelessWidget {
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
              title: 'My Cities',
            ),
          ],
        ),
      ),
    );
  }
}
