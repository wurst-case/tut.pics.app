//Import flutter helper library
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'models/image_model.dart';
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget{
  State<StatefulWidget> createState() {
    return AppState();
  }
}

//Create a class that will be our custom widget
// This class must extend the 'StatelessWidget' base class
class AppState extends State<App>{
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async{
    counter++;
    var response = 
      await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));
    
    setState(() {
      images.add(imageModel);
    });
  }

  //Must define a 'build' method that returns
  // the widgets that *this* widget will show
  Widget build(context){
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
        appBar: AppBar(
          title: Text("Let's See Some Images!"),
        ),
      ),
    );
  }
}

