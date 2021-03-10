import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todo',
    home: ListViewWidget(),
  ));
}

class ListViewWidget extends StatefulWidget{

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  int listNum = 1;
  TextEditingController _todo;
  List todo_list = <Widget>[];

  @override
  initState(){
    _todo = new TextEditingController();
    super.initState();
  }

  addToDo( title, subtitle ) {
    setState(() {
      this.todo_list.add(Card(
        child: ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 30,
          ),
          trailing: Icon(
              Icons.favorite
          ),
          title: Text(title),
          subtitle: Text(subtitle),
          isThreeLine: true,
        ),
      ));
    });

  }

  GenerateList(int num) {
    final List list = <Widget>[];
    for( var i = 1; i <= num; i++ ) {
      addToDo('Index $i','$i');
    }
  }

  @override
  Widget build(BuildContext context) {
    GenerateList(this.listNum);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.redAccent,
                  height: 100,
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  height: 100,
                ),
              )
            ],
          ),
          Row(
            children: [
              IconButton(icon: Icon(Icons.add), onPressed: (){
                setState(() {
                  this.listNum++;
                });
              },
              splashColor: Colors.amber,
              ),
              IconButton(icon: Icon(Icons.remove), onPressed: (){
                setState(() {
                  if( this.listNum > 0 ) {
                    this.listNum--;
                  }
                });
              })
            ],
          ),
          Column(
            children: this.todo_list,
          ),
        ]
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amber,
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Add Todo'),
              content: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Insert Todo"),
                    keyboardType: TextInputType.text,
                    controller: _todo,
                  )
                ],
              ),
              actions: [
                FlatButton(onPressed: (){
                  addToDo(_todo.text, _todo.text);
                }, child: Text('Yes')),
                FlatButton(onPressed: (){}, child: Text('No'))
              ],
            );
          }
        );
      },
        backgroundColor: Colors.amber,
        child: Text("Todo"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
