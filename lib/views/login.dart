// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_cashier/layout/CustomButton.dart';
import 'package:food_cashier/layout/CustomText.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //shadow
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(1),
                    blurRadius: 10,
                    offset: Offset(0, 0), // Shadow position
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.5,

              child: Column(
                children: [
                  Container(
                      // color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Text(
                        'เข้าระบบผู้ใช้งาน',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold),
                      )),
                  Container(
                    // color: Colors.blue,
                    child: InputText(
                      icon: Icons.person,
                      label: '  ชื่อผู้ใช้งาน',
                      hintText: 'ชื่อผู้ใช้งาน',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกชื่อผู้ใช้งาน';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text('\n'),
                  Container(
                    // color: Colors.blue,
                    child: InputText(
                      icon: Icons.lock,
                      label: '  รหัสผู้ใช้งาน',
                      hintText: 'รหัสผู้ใช้งาน',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'กรุณากรอกรหัสผู้ใช้งาน';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text('\n\n'),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: CustomButton(
                            text: 'เข้าสู่ระบบ',
                            onPressed: () {
                              Navigator.pushNamed(context, '/dashboard');
                            },
                          ),
                        ),
                        Text(''),
                        Container(
                          // color: Colors.white,
                          width: MediaQuery.of(context).size.width * 0.1,
                          child: CustomButton(
                            text: 'ลืมรหัสผ่าน',
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
