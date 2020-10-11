import 'package:flutter/material.dart';
import 'package:manejo_archivos/utils/Cargar_data_utils.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:manejo_archivos/widgets/Button_navigator_widget.dart';

class ListUrls extends StatelessWidget {
  const ListUrls({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Url',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        list(context),
        ButtonNavigator(
          label: 'Agregar',
          route: 'Add',
        ),
        
      ],
    );
  }

  Widget list(context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    SavesUrls save = new SavesUrls();
    return FutureBuilder(
        future: save.leerUrl(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.active:
              return Container();
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.none:
              return Container(child: Text("buscando"));
            case ConnectionState.done:
              if (snapshot.data.isEmpty) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: queryData.size.height - 180,
                  child: Center(child: Text("No tienes ninguna ruta agregada")),
                );
              } else {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  height: queryData.size.height - 180,
                  child: ListView(
                    children: urls(snapshot.data, context),
                  ),
                );
              }
          }
        });
  }

  List<Widget> urls(List<dynamic> snapshot, context) {
    List<Widget> listUrls = [];
    SavesUrls save = new SavesUrls();
    for (int i = 0; i < snapshot.length; i += 3) {
      final Temp = InkWell(
        onLongPress: () {
          save.borrarUrl(snapshot[i]);
          Navigator.pushNamedAndRemoveUntil(context, 'main', (route) => false);
        },
        onTap: () {
          cargar_data(context, snapshot[i+1], snapshot[i+2]);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text(
                snapshot[i],
                style: TextStyle(fontSize: 25),
              ),
              Text(snapshot[i + 1]),
              snapshot[i + 2].toString().length != 0
                  ? Text(snapshot[i + 2])
                  : new Container(),
            ],
          ),
        ),
      );

      listUrls
        ..add(Temp)
        ..add(SizedBox(
          height: 15,
        ));
    }

    return listUrls;
  }
}