// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'database.dart';
//
// class DogInformation extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _DogInformationState();
//   }
// }
//
// class _DogInformationState extends State<DogInformation> {
//
//   @override
//   void initState() {
//     SystemChrome.setEnabledSystemUIOverlays([]);
//     super.initState();
//   }
//   final myname = TextEditingController();
//   final myage = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: ListView(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height/3.5,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Color(0xff6bceff),
//                       Color(0xff6bceff)
//                     ],
//                   ),
//                   borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(90)
//                   )
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Spacer(),
//                   Align(
//                     alignment: Alignment.center,
//                     child: Icon(Icons.folder,
//                       size: 90,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Spacer(),
//
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: Padding(
//                       padding: const EdgeInsets.only(
//                           bottom: 32,
//                           right: 32
//                       ),
//                       child: Text('Information About Dog',
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 18
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             Container(
//               height: MediaQuery.of(context).size.height/2,
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.only(top: 62),
//               child: Column(
//                 children: <Widget>[
//                   Container(
//                     width: MediaQuery.of(context).size.width/1.2,
//                     height: 45,
//                     padding: EdgeInsets.only(
//                         top: 4,left: 16, right: 16, bottom: 4
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(50)
//                         ),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 5
//                           )
//                         ]
//                     ),
//                     child: TextField(
//                       controller: myname,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Name of Dog',
//
//                       ),
//                     ),
//                   ),
//
//                   Container(
//                     width: MediaQuery.of(context).size.width/1.2,
//                     height: 45,
//                     margin: EdgeInsets.only(top: 32),
//                     padding: EdgeInsets.only(
//                         top: 4,left: 16, right: 16, bottom: 4
//                     ),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(
//                             Radius.circular(50)
//                         ),
//                         color: Colors.white,
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.black12,
//                               blurRadius: 5
//                           )
//                         ]
//                     ),
//                     child: TextField(
//                       controller: myage,
//                      // obscureText: true,
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Age',
//                       ),
//                     ),
//                   ),
//
//                   Spacer(),
//
//                   InkWell(
//                     onTap: (){
//                       //var database =new databasehelper();
//                       var data = Dog(
//                         id: 0,
//                         name: myname.text,
//                         age: int.parse(myage.text),
//                       );
//                       // dogdata(data);
//
//                     },
//                     child: Container(
//                       height: 45,
//                       width: MediaQuery.of(context).size.width/1.2,
//                       decoration: BoxDecoration(
//                           gradient: LinearGradient(
//                             colors: [
//                               Color(0xff6bceff),
//                               Color(0xFF00abff),
//                             ],
//                           ),
//                           borderRadius: BorderRadius.all(
//                               Radius.circular(50)
//                           )
//                       ),
//                       child: Center(
//                         child: Text('Submit'.toUpperCase(),
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 50,
//             ),
//           ],
//
//         ),
//       ),
//     );
//   }
//
// }
