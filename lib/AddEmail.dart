import 'package:flutter/material.dart';

class EmailAdder extends StatefulWidget{
  @override
  _EmailAdderState createState() => _EmailAdderState();
}

class _EmailAdderState extends State<EmailAdder>{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: Text('Compose'),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.attach_file), onPressed: null),
            IconButton(icon: Icon(Icons.send), onPressed: null),
            IconButton(icon: Icon(Icons.more_vert), onPressed: null)
          ],
        ),
        body: MyEmailFields(),
      )
    );
  }
}


class MyEmailFields extends StatefulWidget{
  @override
  _MyEmailFieldsState createState() => _MyEmailFieldsState();
}

class _MyEmailFieldsState extends State<MyEmailFields>{
  final _formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(child:
              TextFormField(
                validator: (value){
                  if (value.isEmpty){
                    return 'Please enter sender email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'From'
                ),
              ),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical:16.0)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(child:
              TextFormField(
                validator: (value){
                  if (value.isEmpty){
                    return 'Please enter sender email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'To'
                ),
              ),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical:16.0)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(child:
              TextFormField(
                validator: (value){
                  if (value.isEmpty){
                    return 'Please enter sender email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: 'Subject'
                ),
              ),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical:16.0)),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(child:
              Container(
                alignment: Alignment.center,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(1,1,1,1),
                child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Compose Email',
                  ),
                ),
              )
              ),
            ],
          )
        ]
      )
    );
  }
}

