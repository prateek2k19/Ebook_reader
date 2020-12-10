import 'package:flutter/material.dart';
import 'package:myapp3/screens/pdf_viewer.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BrowseScreen extends StatefulWidget {
  static String id = 'browse_screen';
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  Future<Widget> _getImage(BuildContext context, String imageName) async{
            Image image;
            await FireStorageService.loadImage(context, imageName).then((value){
              image=Image.network(
                value.toString(),
                fit: BoxFit.scaleDown
              );
            });
            return image;
          }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 9),
              height: 81,
              width: MediaQuery.of(context).size.width,
              color: Colors.cyan[100],
              child: Center(
                child:Row(
                children: <Widget>[
                  Container(
                    height: 81,
                    width: 62,
                    child: FutureBuilder(
                      future: _getImage(context, "book$index.jpeg"),
                      builder: (context, snapshot){
                        if(snapshot.connectionState == ConnectionState.done){
                          return Container(
                            width: 62,
                            height: 81,
                            child: snapshot.data,
                          );
                        }

                        if(snapshot.connectionState == ConnectionState.waiting){
                          return Container(
                            width: 62,
                            height: 81,
                            child: CircularProgressIndicator(),
                          );
                      }

                      return Container();

                      }),
                  ),
                  SizedBox(
                    width: 80,
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
              ),
            );
          },
        ),
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async{
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
