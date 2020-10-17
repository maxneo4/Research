import 'package:flutter/material.dart';
import 'package:manejo_archivos/pages/Principal_page.dart';
import 'package:manejo_archivos/providers/Contador_Answers_provider.dart';
import 'package:manejo_archivos/providers/Numero_Question_provider.dart';
import 'package:manejo_archivos/utils/Buscar_archivo_utils.dart';
import 'package:manejo_archivos/utils/Cargar_data_utils.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:provider/provider.dart';

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final contador = Provider.of<ContadorAnswer>(context, listen: false);

    SaveState state = new SaveState();
    TextStyle style = new TextStyle(fontSize: 25);
    return FutureBuilder(
        future: state.leerDatos(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Container();
            case ConnectionState.waiting:
              return Scaffold(
                body: Center(
                child: CircularProgressIndicator(),
              ),
              );
            case ConnectionState.none:
              return Container(child: Text("buscando"));
            case ConnectionState.done:
              if (snapshot.data.isNotEmpty) {
                datos data = new datos(snapshot.data);
                return Scaffold(
                    body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Tienes una sesión iniciada',
                          style: style,
                        ),
                        SizedBox(height: 15,),
                        Text('Nombre: '+
                          data.name,
                          style: style,
                        ),
                        Text(
                          data.type,
                          style: style,
                        ),
                        SizedBox(height: 15,),
                        Text(
                          'Deseas Continuar?',
                          style: style,
                        ),
                        SizedBox(height: 15,),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.redAccent,
                          child: Text('No'),
                          onPressed: () {
                          Navigator.pushReplacementNamed(context, 'main');
                          state.borrar();
                        }),
                        SizedBox(width: 80,),
                        RaisedButton(
                          color: Colors.greenAccent,
                          child: Text('Si'),
                          onPressed: () {
                            contador.Corrects=int.parse(data.buenas);
                            contador.Jumps=int.parse(data.saltadas);
                            contador.deco(data.malas);
                            //state.borrar();
                            if(data.type=="url"){
                              cargar_data(context, data.url, data.preguntas, int.parse(data.pos));
                            }else{
                              readCounter(context, data.url, int.parse(data.pos),data.preguntas);
                            }
                          
                        })
                      ],
                    )
                  ],
                ));
              } else {
                return Principal_page();
              }
          }
        });
  }     
}

class datos {
  String type;
  String name;
  String url;
  String malas;
  String buenas;
  String saltadas;
  String pos;
  String preguntas;

  datos(List<dynamic> data) {
    //print(data);
    type = data[0];
    name = data[1];
    url = data[2];
    malas = data[3];
    buenas = data[4];
    saltadas = data[5];
    pos = data[6];
    preguntas = data[7];

  }
}
