import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import  'package:http/http.dart' as http;
import 'dtos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<User> users= [];
  var loading = false;

  Future<Null> fetchUsers() async{
    setState(() {
      loading = true;
    });

    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      setState(() {
        for(Map i in data) {
          users.add(User.fromJson(i));
        }
        loading = false;
      });
    }
  }
  void _nextUser() {
    setState(() {
      fetchUsers();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Users'),
        centerTitle: true,
      ),
      body: Container(
        child: loading? Center(
            child: CircularProgressIndicator()): ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, i){
              final nDataList = users[i];
              return Container(
                child: InkWell(
                  child: Card(
                    color: Colors.blueGrey[100],
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(nDataList.name, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black),
                          ),
                        ],
                      )
                    ),
                  ),

                ),
              );
            }),
      ),
    );
  }
}