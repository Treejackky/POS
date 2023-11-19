import 'package:flutter/material.dart';
import 'package:food_cashier/model/data.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
                    color: Colors.blue,
                    child: Column(children: [
                      Container(
                        color: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Column(
                          children: [
                            Text('\n'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 10,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Text(
                                    'Pot Size',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 10,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Soup',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(1),
                                        blurRadius: 10,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    'Menu',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
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
                          //add dollars
                          Icons.attach_money,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          //icon รายงานสรุปผล
                          //,
                          Icons.bar_chart_sharp,
                          size: MediaQuery.of(context).size.height * 0.07,
                        ),
                        Icon(
                          //icon นาฬิกา เดินหน้า
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
                  left: 20,
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
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.2,
                    color: Colors.white,
                    //left

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                        Text(
                          'Promotion',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                        Text(
                          'Delivery',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                        Text(
                          'Plan Resturaunt',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height * 0.4,
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
}
