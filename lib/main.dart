import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:internativeapp/states/userState.dart';
import 'package:internativeapp/view/userList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserState(),
          child: MaterialApp(
            title: 'User',
            debugShowCheckedModeBanner: false,
             theme: ThemeData(
             primarySwatch: Colors.orange,
                ),
               home: Home(),
      ),
    );
  }
}