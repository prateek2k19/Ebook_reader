import 'package:flutter/material.dart';
import 'package:myapp3/screens/pdf_viewer.dart';

class BrowseScreen extends StatefulWidget {
  static String id = 'browse_screen';
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 19),
              height: 81,
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 81,
                    width: 62,
                    child: Image(
                      image: AssetImage('assets/images/b1.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => MyApp()));
                      },
                      child: Text('Read'),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
