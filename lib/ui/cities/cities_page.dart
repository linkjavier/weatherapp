import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:weatherflut/ui/cities/add/add_city_page.dart';
import 'package:weatherflut/ui/cities/ui_constants.dart';
import 'package:weatherflut/ui/common/header_widget.dart';

class CitiesPage extends StatelessWidget {
  void handleNavigatePress(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, animation1, animation2) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0.0, 1.0),
              end: Offset(0.0, 0.0),
            ).animate(animation1),
            child: AddCityPage(),
          );
        },
      ),
    );
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        onPressed: () => handleNavigatePress(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HeaderWidget(
              title: 'My Cities',
            ),
            Expanded(
              child: Center(
                child: Text('Yoy have not cities :('),
              ),
            )
          ],
        ),
      ),
    );
  }
}
