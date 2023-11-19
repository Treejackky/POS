// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_cashier/model/data.dart';

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<bool> isHovering = List.filled(5, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.grey[200],
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.01,
                        ),
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('\n'),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              // width: MediaQuery.of(context).size.width * 0.16,
                              child: DropdownButton<String>(
                                hint: Text(
                                  'Select Floor',
                                  style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.04,
                                  ),
                                ),
                                items: <String>[
                                  '1 st Floor',
                                  '2 nd Floor',
                                  '3 th Floor',
                                ].map(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList(),
                                value: data['floor'],
                                onChanged: (newValue) {
                                  setState(() {
                                    data['floor'] = newValue;
                                  });
                                  print('Selected floor: $newValue');
                                },
                                icon: Icon(
                                  Icons.expand_more,
                                  size:
                                      MediaQuery.of(context).size.height * 0.08,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ]),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.home,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          Icons.attach_money,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          Icons.bar_chart_sharp,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          Icons.access_time,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          Icons.people,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.01,
                ),
                height: MediaQuery.of(context).size.height * 1,
                width: MediaQuery.of(context).size.width * 0.2,
                color: Colors.white,
                child: Column(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.white,
                    child: Text(
                      '\nPOS Restaurant',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.04,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.white,
                    //left

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/order');
                          },
                          child: Hover('Order', 0),
                        ),
                        Text('  '),
                        GestureDetector(
                          onTap: () {},
                          child: Hover('Promotion', 1),
                        ),
                        Text('  '),
                        GestureDetector(
                          onTap: () {},
                          child: Hover('Delivery', 2),
                        ),
                        Text('  '),
                        GestureDetector(
                          onTap: () {},
                          child: Hover('Dashboard', 3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.settings,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text('  '),
                            Text(
                              'Setting',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.help,
                              size: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text('  '),
                            Text(
                              'Help',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                            ),
                          ],
                        ),
                        Text('  '),
                      ],
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Hover(label, i) {
    return MouseRegion(
      cursor: SystemMouseCursors.move,
      onEnter: (event) {
        setState(() {
          isHovering[i] = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovering[i] = false;
        });
      },
      child: isHovering[i]
          ? Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 156, 156, 156),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                ),
              ),
            ),
    );
  }
}
