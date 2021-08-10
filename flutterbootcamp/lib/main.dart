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
          'Flutter Bootcamp',
          style: TextStyle(
            fontSize: 20.0,
            //letterSpacing: 2.0,
           // color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height:130),
          Text("Enter Your Crendentials ",style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              labelText: 'enter username',
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              hintText: 'Password',
              labelText: 'enter password',
            ),),
          ),
          FlatButton(onPressed: (){}, child: Text("Login"), color: Colors.blue,)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Text('press'),
        onPressed: () {  },

      ),
    );;
  }
}
 