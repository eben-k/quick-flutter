import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.teal,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          AssetImage('images/i_am_rich_app_icon.png')),
                  Text(
                    'Paa Kwesi',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                        color: Colors.white),
                  ),
                  Text(
                    ('Frontend Developer').toUpperCase(),
                    style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 25,
                        color: Colors.teal.shade100),
                  ),
                  SizedBox(
                    height: 20.0,
                    width: 150.0,
                    child: Divider(color: Colors.teal.shade100,),
                  ),
                  Card(
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.teal.shade900,
                        size: 20.0,
                      ),
                      title: Text(
                        '+233 246 806707',
                        style: TextStyle(
                            color: Colors.teal.shade900,
                            fontSize: 20.0,
                            fontFamily: 'SourceSansPro'),
                      ),
                    ),
                  ),
                  Card(
                      margin: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.teal.shade900,
                          size: 20.0,
                        ),
                        title: Text(
                          'ennim.consults@gmail.com',
                          style: TextStyle(
                              color: Colors.teal.shade900,
                              fontSize: 20.0,
                              fontFamily: 'SourceSansPro'),
                        ),
                      ))
                ],
              ),
            )));
  }
}
