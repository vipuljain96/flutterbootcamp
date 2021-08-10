import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'my first app',
          style: TextStyle(
            fontSize: 20.0,
            //letterSpacing: 2.0,
           // color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("hello",style:TextStyle(backgroundColor: Colors.blue)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Text('press'),
        onPressed: () {  },

      ),
    );;
  }
}
 