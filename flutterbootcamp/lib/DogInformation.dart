import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'database.dart';
var dogDao = new DogDao();
var database;
void main() async{
  //database = dogDao.openDb();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  //pair programming -- driver, navigator
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'add dog',
      home: Scaffold(
        appBar: AppBar(title: Text('insert dog'),),
        body: Column(children:<Widget>[
          AddDogForm(),
          Expanded(
            child: FutureBuilder<List>(
              future: dogDao.getDogs(),
             // initialData: List(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, int position) {
                    final item = snapshot.data?[position];
                    //get your item data here ...
                    return Card(
                      child: ListTile(
                        title: Text(
                            "id: " + (snapshot.data?[position].id).toString() +"       DogName: " + snapshot.data?[position].name + "       Age: " + (snapshot.data?[position].age).toString()),
                      ),
                    );
                  },
                )
                    : Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),

        ]),
      ),
    );
  }
}

class AddDogForm extends StatefulWidget {
  const AddDogForm({Key? key}) : super(key: key);

  @override
  _AddDogFormState createState() => _AddDogFormState();
}


class _AddDogFormState extends State<AddDogForm> {
  int id = 0;
  int age = 0;
  String name = '';
  var idController = TextEditingController();
  var nameController = TextEditingController();
  var ageController = TextEditingController();

  void _addDog() async{
    setState(() {
      id = int.parse(idController.text);
      age = int.parse(ageController.text);
      name = nameController.text;
    });
    var dog = Dog(id:id,name:name,age: age);
    await dogDao.insertDog(dog);
  }
  void _getDogs(){
    dogDao.getDogs();
    setState(() {

    });

  }

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: idController,
              decoration: InputDecoration(labelText: 'id'),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'name'),
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'age'),
            ),
            RaisedButton(onPressed: _addDog, child: Text('add dog'),),
            RaisedButton(onPressed: _getDogs, child: Text('get dog'),),

          ],
        ),
      ),
    );
  }
}