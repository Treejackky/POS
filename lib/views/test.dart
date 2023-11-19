// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_cashier/views/gridpainter.dart';
//import math
import 'dart:math' as math;

class CustomContainer extends StatefulWidget {
  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  List<Offset> positions = [];
  List<Map<String, dynamic>> tables = [];
  List<double> rotationAngles =
      []; // Added to track rotation angles for each table

  Map<String, dynamic> order = {'tables': [], 'position': []};

  @override
  void initState() {
    super.initState();
    addContainer('Single', 1, 300.0, 0.0);
    addContainer('Duo', 1, 600.0, 0.0);
    addContainer('Family', 1, 900.0, 0.0);
    addContainer('Bar', 1, 1200.0, 0.0);
    updateOrder();
    rotationAngles = List.generate(tables.length, (index) => 0.0);
  }

  void addContainer(String type, int count, double x, double y) {
    setState(() {
      positions.add(Offset(x, y));
      tables.add({
        'type': type,
        'num_table': count,
        'offset': Offset(x, y),
        'rotation': 0.0,
      });
      rotationAngles.add(0.0);
      updateOrder();
    });
  }

  void updateOrder() {
    order['tables'] = tables;
    order['position'] = positions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CustomPaint(
                  painter: GridPainter(),
                  child: Stack(
                    children: List.generate(positions.length, (index) {
                      return Positioned(
                        left: positions[index].dx,
                        top: positions[index].dy,
                        child: Draggable(
                          data: index,
                          child: Table(index),
                          feedback: Table(index),
                          childWhenDragging: Container(),
                          onDragEnd: (details) {
                            setState(() {
                              int countSingle = 0;
                              int countDuo = 0;
                              int countFamily = 0;
                              int countBar = 0;
                              int lastIndexSingle = -1;
                              int lastIndexDuo = -1;
                              int lastIndexFamily = -1;
                              int lastIndexBar = -1;

                              for (int i = 0; i < tables.length; i++) {
                                if (tables[i]['type'] == 'Single') {
                                  countSingle++;
                                  countSingle = i;
                                  order['num_table'] = countSingle;
                                } else if (tables[i]['type'] == 'Duo') {
                                  countDuo++;
                                  lastIndexDuo += 1;
                                  order['num_table'] = countDuo;
                                } else if (tables[i]['type'] == 'Family') {
                                  countFamily++;
                                  lastIndexFamily = i;
                                  order['num_table'] = countFamily;
                                } else if (tables[i]['type'] == 'Bar') {
                                  countBar++;
                                  lastIndexBar = i;
                                  order['num_table'] = countBar;
                                }
                              }

                              // print('Count of Single Tables: $countSingle');
                              // print('Count of Duo Tables: $countDuo');
                              // print('Count of Family Tables: $countFamily');
                              // print('Count of Bar Tables: $countBar');

                              if (tables[index]['type'] == 'Single' &&
                                  countSingle != lastIndexSingle + 1) {
                                addContainer('Single', countSingle, 300.0, 0.0);
                              } else if (tables[index]['type'] == 'Duo' &&
                                  countDuo != lastIndexDuo + 1) {
                                addContainer('Duo', countDuo, 600.0, 0.0);
                              } else if (tables[index]['type'] == 'Family' &&
                                  countFamily != lastIndexFamily + 1) {
                                addContainer('Family', countFamily, 900.0, 0.0);
                              } else if (tables[index]['type'] == 'Bar' &&
                                  countBar != lastIndexBar + 1) {
                                addContainer('Bar', countBar, 1200.0, 0.0);
                              }

                              positions[index] = details.offset;
                              // updateOrder();
                              // print(tables);
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  top: MediaQuery.of(context).size.height * 0.8,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            for (int i = 0; i < tables.length; i++) {
                              if (tables[i]['type'] == 'Single') {
                                print('Single');
                              }
                              if (tables[i]['type'] == 'Duo') {
                                print('Duo');
                              }
                              if (tables[i]['type'] == 'Family') {
                                print('Family');
                              }
                              if (tables[i]['type'] == 'Bar') {
                                print('Bar');
                              }
                            }
                            print(order['num_table']);
                            print(tables);
                          },
                          child: Text('Print Container'),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              order.clear();
                              positions.clear();
                              tables.clear();
                              addContainer('Single', 1, 300.0, 0.0);
                              addContainer('Duo', 1, 600.0, 0.0);
                              addContainer('Family', 1, 900.0, 0.0);
                              addContainer('Bar', 1, 1200.0, 0.0);
                              updateOrder();
                              rotationAngles =
                                  List.generate(tables.length, (index) => 0.0);
                              updateOrder();
                            });
                          },
                          child: Text('Clear Container'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget Chair() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(MediaQuery.of(context).size.width),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              blurRadius: 3,
              offset: Offset(0, 0), // Shadow position
            ),
          ],
        ),
      ),
    );
  }

  Widget Table(
    index,
  ) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          rotationAngles[index] +=
              math.pi / 4; // Added 45 degrees to the rotation angle
        });
      },
      child: Transform.rotate(
        angle: rotationAngles[index],
        child: tables[index]['type'] == 'Single'
            ? Column(
                children: [
                  Row(
                    children: [Chair(), Chair(), Chair()],
                  ),
                  Row(
                    children: [
                      Chair(),
                      Table_Plan(index),
                      Chair(),
                    ],
                  ),
                  Row(
                    children: [Chair(), Chair(), Chair()],
                  ),
                ],
              )
            : tables[index]['type'] == 'Duo'
                ? Column(children: [
                    Row(
                      children: [Chair()],
                    ),
                    Table_Plan(index),
                    Row(
                      children: [Chair()],
                    ),
                  ])
                : tables[index]['type'] == 'Family'
                    // ? Column(children: [
                    //     Row(
                    //       children: [Chair()],
                    //     ),
                    //     Table_Plan(index),
                    //     Row(
                    //       children: [Chair()],
                    //     ),
                    //   ])
                    ? Column(
                        children: [
                          Row(
                            children: [Chair(), Chair()],
                          ),
                          Table_Plan(index),
                          Row(
                            children: [Chair(), Chair()],
                          ),
                        ],
                      )
                    : Column(children: [
                        Row(
                          children: [Chair()],
                        ),
                        Table_Plan(index)
                      ]),
      ),
    );
  }

  Widget Table_Plan(index) {
    return Column(
      children: [
        Container(
          width: 110.0,
          height: 60.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(1),
                blurRadius: 3,
                offset: Offset(0, 0), // Shadow position
              ),
            ],
          ),
          child: Center(child: Text('${order['tables'][index]['num_table']}')),
        ),
      ],
    );
  }
}
