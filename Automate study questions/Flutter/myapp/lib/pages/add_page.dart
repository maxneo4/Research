import 'package:flutter/material.dart';
import 'package:myapp/providers/add_provider.dart';
import 'package:myapp/utils/Urls_utils.dart';

import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Agregar Url",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        field("Titulo", context),
        field("URL", context),
        button(context)
      ],
    )));
  }

  Widget field(type, context) {
    final add = Provider.of<Add>(context, listen: false);
    TextEditingController _text = new TextEditingController();

    return Container(
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        textInputAction: TextInputAction.done,
        minLines: 1,
        maxLines: 5,
        controller: _text,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: type,
        ),
        onChanged: (valor) {
          if(type=="Titulo"){
            add.title=valor;
          }else{
            add.url=valor;
          }
        },
      ),
    );
  }

  Widget button(context) {
    final add = Provider.of<Add>(context, listen: false);
    Urls U= new Urls();
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        color: Colors.red,
        child: Text("Agregar", style: TextStyle(fontWeight: FontWeight.bold),),
        onPressed: () {
          U.guardarUrl(add.title, add.url);
          Navigator.pushNamed(context, "listurl");
        }
      ),
    );
  }
}
