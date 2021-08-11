import 'package:flutter/material.dart';
import 'package:flutterbootcamp/main.dart';
import 'package:fl_chart/fl_chart.dart';

class FlutterChart extends StatefulWidget {
  const FlutterChart({Key? key}) : super(key: key);

  @override
  _FlutterChartState createState() => _FlutterChartState();
}

class _FlutterChartState extends State<FlutterChart> {
  //const Calculator({Key? key}) : super(key: key);
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  var cutOffYValue = 0.0;
  var yearTextStyle = TextStyle(fontSize: 12, color: Colors.black);
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 60),
          Container(
            padding: EdgeInsets.only(right: 10),
            height: 300,
            width: 400,
            child: LineChart(
              LineChartData(
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 1),
                      FlSpot(2, 3),
                      FlSpot(3, 4),
                      FlSpot(3, 5),
                      FlSpot(4, 4)
                    ],
                    isCurved: true,
                    barWidth: 10,
                    colors: [
                      Colors.black,
                    ],
                    belowBarData: BarAreaData(
                      show: true,
                      colors: [Colors.lightBlue.withOpacity(0.5)],
                      cutOffY: cutOffYValue,
                      applyCutOffY: true,
                    ),
                    aboveBarData: BarAreaData(
                      show: true,
                      colors: [Colors.black.withOpacity(0.5)],
                      cutOffY: cutOffYValue,
                      applyCutOffY: false,
                    ),
                    dotData: FlDotData(
                      show: false,
                    ),
                  ),
                ],
                minY: 0,
                titlesData: FlTitlesData(
                  bottomTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 5,
                      //textStyle: yearTextStyle,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return '2016';
                          case 1:
                            return '2017';
                          case 2:
                            return '2018';
                          case 3:
                            return '2019';
                          case 4:
                            return '2020';
                          default:
                            return '';
                        }
                      }),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      return '\$ ${value + 100}';
                    },
                  ),
                ),
                axisTitleData: FlAxisTitleData(
                    leftTitle: AxisTitle(
                        showTitle: true, titleText: 'Value', margin: 10),
                    bottomTitle: AxisTitle(
                        showTitle: true,
                        margin: 15,
                        titleText: 'Year',
                        // textStyle: yearTextStyle,
                        textAlign: TextAlign.right)),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (double value) {
                    return value == 1 || value == 2 || value == 3 || value == 4;
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: 60),
          //SizedBox(height:40)
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
                backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile'),
              backgroundColor: Colors.blue,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}
