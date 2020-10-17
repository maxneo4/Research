import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:manejo_archivos/utils/Saves_utils.dart';
import 'package:manejo_archivos/widgets/Leer_archivo_widget.dart';
import 'package:manejo_archivos/widgets/List_urls_widgets.dart';

class Principal_page extends StatefulWidget {
  Principal_page({Key key}) : super(key: key);

  @override
  _Principal_pageState createState() => _Principal_pageState();
}

class _Principal_pageState extends State<Principal_page> {
  int _page=0;
  @override
  Widget build(BuildContext context) {
    return principal();
  }

  Widget principal(){
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
            items: [
              //TabItem(icon: Icons.archive_outlined, title: "Archivo"),
              TabItem(icon: Icons.public_sharp, title: "Save"),
              TabItem(icon: Icons.attach_file_rounded, title: "Archivo"),
            ],
            style: TabStyle.flip,
            initialActiveIndex: 0,
            curveSize: 120,
            elevation: 5,
            onTap: (value) {
              setState(() {
                _page=value;
              });
            },
            backgroundColor: Colors.cyan,
          ),
      body: Column(
        children: [
          _page==0?ListUrls():LeerArchivo(),
        ],
      ),
    );
  }

}
