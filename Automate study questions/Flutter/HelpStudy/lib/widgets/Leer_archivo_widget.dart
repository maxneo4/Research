import 'package:flutter/material.dart';
import 'package:manejo_archivos/utils/Buscar_archivo_utils.dart';

class LeerArchivo extends StatelessWidget {
  const LeerArchivo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                onPressed: () {
                  openFileExplorer(context);
                },
                child: Text('Buscar Archivo'),
                color: Colors.greenAccent,
              ),
            ],
          )
        ],
      ),
    );
  }
}
