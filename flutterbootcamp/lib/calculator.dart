import 'package:flutter/material.dart';

class Calc extends StatefulWidget {
  @override
  _CalcState createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  String val = '';
  String query = '';
  var history = ['22 x 66', '984 / 43'];
  var calcList = [];
  String calcQuery = '';

  Widget calcRow(child1, child2, child3, child4) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RaisedButton(
          color: Colors.grey[700],
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          onPressed: () {
            val = child1;
            calcQuery += val;
            setState(() {
              query += val;
            });
          },
          child: Text(
            child1,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        RaisedButton(
          color: Colors.grey[700],
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          onPressed: () {
            val = child2;

            calcQuery += val;
            setState(() {
              query += val;
            });
          },
          child: Text(
            child2,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        RaisedButton(
          color: Colors.grey[700],
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          onPressed: () {
            val = child3;
            calcQuery += val;
            setState(() {
              query += val;
            });
          },
          child: Text(
            child3,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
        RaisedButton(
          color: Colors.grey[700],
          // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
          onPressed: () {
            val = child4;
            if (val == '=') {
              calcList.add(calcQuery);
              print(calcList);
              var result =
              double.parse(calculation(calcList)).toStringAsFixed(2);
              setState(() {
                history.add(query);
                query = result.toString();
                calcQuery = query;
                calcList.clear();
                calcList.add(calcQuery);
                // print(result);
              });
            } else {
              calcList.add(calcQuery);
              calcList.add(val);
              calcQuery = '';
              setState(() {
                // query = query + ' ' + val + ' ';
                query += val;
              });
            }
          },
          child: Text(
            child4,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  double answer(val1, val2, op) {
    var result;
    if (op == '+') {
      result = val1 + val2;
      op = '';
    } else if (op == '-') {
      result = val1 - val2;
      op = '';
    } else if (op == 'x') {
      result = val1 * val2;
      op = '';
    } else if (op == '/') {
      result = val1 / val2;
      op = '';
    } else if (op == '%') {
      result = val1 % val2;
      op = '';
    }
    // print('==============');
    // print(val1);
    // print(op);
    // print(val2);
    // print('==============');
    // print(result);
    return result;
  }

  String calculation(calcList) {
    var op = '';
    double val1 = 0;
    double val2 = 0;
    bool atLeastTwoItems = false;
    // bool callAnswer = false;
    for (var item in calcList) {
      // print(item);
      if (item == '+' ||
          item == '-' ||
          item == 'x' ||
          item == '/' ||
          item == '%') {
        op = item;
        // print(op);
        // print('item in op');
      } else if (op == '') {
        val1 = double.parse(item);
        atLeastTwoItems = true;
      } else if (atLeastTwoItems) {
        val2 = double.parse(item);
        val1 = answer(val1, val2, op);
      }
    }
    return val1.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Colors.teal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        centerTitle: true,
        title: Text(
          'Calc',
          style: TextStyle(
            // fontFamily: 'IndieFlower',
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'History',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: 370,
              child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        setState(() {
                          query = history[index];
                        });
                      },
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(history[index]),
                            Divider(
                              height: 10,
                              color: Colors.black,
                            )
                          ]),
                    );
                  }),
            ),
            Container(
              color: Colors.blue,
              // height: MediaQuery.of(context).size.height * 0.,
              width: MediaQuery.of(context).size.width,
              child: Text(
                query,
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  onPressed: () {
                    setState(() {
                      history.add(query);
                      query = '';
                    });
                  },
                  child: Text(
                    'AC',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                RaisedButton(
                  color: Colors.grey[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  onPressed: () {
                    val = '%';
                    calcList.add(calcQuery);
                    calcList.add(val);
                    calcQuery = '';
                    setState(() {
                      // query = query + ' ' + val + ' ';
                      query += val;
                    });
                  },
                  child: Text(
                    '%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                RaisedButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  onPressed: () {
                    setState(() {
                      query = query.substring(0, query.length - 1);
                    });
                  },
                  child: Icon(
                    Icons.highlight_remove_sharp,
                  ),
                ),
                RaisedButton(
                  color: Colors.grey[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80)),
                  onPressed: () {
                    val = '/';
                    calcList.add(calcQuery);
                    calcList.add(val);
                    calcQuery = '';
                    setState(() {
                      // query = query + ' ' + val + ' ';
                      query += val;
                    });
                  },
                  child: Text(
                    '/',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            calcRow(7.toString(), 8.toString(), 9.toString(), 'x'),
            SizedBox(
              height: 20,
            ),
            calcRow(4.toString(), 5.toString(), 6.toString(), '-'),
            SizedBox(
              height: 20,
            ),
            calcRow(1.toString(), 2.toString(), 3.toString(), '+'),
            SizedBox(
              height: 20,
            ),
            calcRow(',', 0.toString(), '.'.toString(), '='),
          ],
        ),
      ),
    );
  }
}
