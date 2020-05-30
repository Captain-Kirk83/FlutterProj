import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import '../Models/maildb.dart';
import '../Utility/database_settings.dart';
import '../Screens/mail_detail.dart';
import '../Screens/mail_template.dart';
import 'package:sqflite/sqflite.dart';

class EmailList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => EmailListState();
}

class EmailListState extends State<EmailList>{
  DatabaseHelper databaseHelper= DatabaseHelper();
  List<MailDB> emailList;
  int count=0;

  @override
  Widget build(BuildContext context){
      if(emailList==null){
      emailList=List<MailDB>();
      updateEmailView();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            navigateToSend(MailDB('', '', '', ''));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.lightBlue,
          ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Flexible( child: Searching(),)
              ]
            ),
            Row(
              children:[
                Container(
                  height: double.maxFinite,
                  child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: count,
                  itemBuilder: (BuildContext context, int position){
                  return Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.people),
                        ),
                      title: Text(this.emailList[position].subject, style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(this.emailList[position].mail),
                    )
                  );
                  }
                )
                )
                  ]
            )
          ],
        )
      ),
    );

    
  }


  void navigateToSend(MailDB mail) async{
    bool result= await Navigator.push(context, MaterialPageRoute(builder: (context){
      return EmailDetail(mail);
    }));

    if(result){
      updateEmailView();
    }
  }


  /*ListView getEmailListView(){
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: count,
      itemBuilder: (BuildContext context, int position){
        return Card(
        color: Colors.white,
        elevation: 2.0,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.people),
          ),
          title: Text(this.emailList[position].subject, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(this.emailList[position].mail),
        )
      );
      }
      
    );
  }*/

  void updateEmailView(){
    final Future<Database> db= databaseHelper.initializeDatabase();
    db.then((database){
      Future<List<MailDB>> mailListFuture = databaseHelper.getMailList();
      mailListFuture.then((emailList){
        setState(() {
          this.emailList=emailList;
          this.count=emailList.length;
        });
      });
    });
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
           suffixIcon: Icon(Icons.search),
           prefixIcon: Icon(Icons.menu)
            ),
      ),
    );
  }
}