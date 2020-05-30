import 'package:flutter/material.dart';
import './Screens/mail_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'EmailList',
      home: EmailList(),
    );
  }
}



/*class Email extends StatefulWidget{
  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Searching(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmailAdder()) 
               );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlue,
          ),
    );
  }
}

class Searching extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(1,1,1,1),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
           hintText: 'Search',
           suffixIcon: Icon(Icons.search)
            ),
      ),
    );
  }
}*/



