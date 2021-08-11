import 'package:flutter/material.dart';
import 'package:flutterbootcamp/main.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 20.0,
            //letterSpacing: 2.0,
            // color: Colors.red,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(onPressed: () {}, child: Text("C"),color: Colors.grey,),
              FlatButton(onPressed: () {}, child: Text("%"),color: Colors.grey,),
              FlatButton(onPressed: () {}, child: Icon(Icons.backspace),color: Colors.grey,),
              FlatButton(onPressed: () {}, child: Text("/"),color: Colors.grey,),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(onPressed: () {}, child: Text("7"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("8"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("9"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("X"),color: Colors.grey),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(onPressed: () {}, child: Text("4"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("5"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("6"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("-"),color: Colors.grey),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(onPressed: () {}, child: Text("1"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("2"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("3"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("+"),color: Colors.grey),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlatButton(onPressed: () {}, child: Text("00"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("0"),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("."),color: Colors.grey),
              FlatButton(onPressed: () {}, child: Text("="),color: Colors.grey),
            ],
          ),
          SizedBox(height:40)
        ],
      )),
    );
  }
}
