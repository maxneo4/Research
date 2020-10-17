import 'package:flutter/material.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';

class AddPage extends StatelessWidget {
  AddPage({Key key}) : super(key: key);
  String title;
  String url;
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
          if(type=='Titulo'){
            this.title=valor;
          }else{
            this.url=valor;
          }
        },
      ),
    );
  }

  Widget button(context) {
    SavesUrls saves= new SavesUrls();
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: RaisedButton(
        color: Colors.red,
        child: Text("Agregar", style: TextStyle(fontWeight: FontWeight.bold),),
        onPressed: () {
          saves.guardarUrl(title, url);
          Navigator.pushNamed(context, "main");
        }
      ),
    );
  }
}
