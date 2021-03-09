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
  TextEditingController _number;

  @override
  initState(){
    _number = new TextEditingController();
    super.initState();
  }

  List GenerateList(int num) {
    final List list = <Widget>[];
    for( var i = 1; i <= num; i++ ) {
      list.add(Card(
        child: ListTile(
          leading: Icon(
            Icons.account_circle,
            size: 30,
          ),
          trailing: Icon(
            Icons.favorite
          ),
          title: Text('Index $i'),
          subtitle: Text( '$i' ),
          isThreeLine: true,

        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: ListView(
        children: [
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
            children: GenerateList(this.listNum),
          ),
        ]
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
                    decoration: InputDecoration(hintText: "Update Info"),
                    keyboardType: TextInputType.number,
                    controller: _number,
                  )
                ],
              ),
              actions: [
                FlatButton(onPressed: (){
                  setState(() {
                    var n = int.parse(_number.text);
                    if( n >= 0 ) {
                      this.listNum = n;
                    }
                  });
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
    );
  }
}
