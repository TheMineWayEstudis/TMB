import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP TMB',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("TMB"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.place),
              title: Text("Com arribar"),
              subtitle: Text("Indica quin trajecte vols realitzar"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.gps_fixed),
              title: Text("On soc"),
              subtitle: Text("Et mostrarem les parades més properes"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text("iBus-iMetro"),
              subtitle: Text("Consulta el temps d'espera a la parada o estació"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_activity),
              title: Text("Bitllets"),
              subtitle: Text("Ja pots comprar bitllets desde la app"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text("Trajectes grupals"),
              subtitle: Text("Coordina els trajectes de diverses persones"),
              onTap: () => GroupalVoyages(),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.map),
              title: Text("Mapa"),
              subtitle: Text("Observa la zona"),
              onTap: () => DisplayMap(),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus, color: Colors.red,),
              title: Text("Línies de bus"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_railway, color: Colors.red,),
              title: Text("Línies de metro"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red,),
              title: Text("Avisos de servei"),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Email",
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey
              ),
            ),
            ListTile(
              leading: Icon(Icons.local_activity),
              title: Text("Els meus bitllets"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text("Historial de compres"),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Métodes de pagament"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Els meus preferits"),
            ),
            ListTile(
                leading: Icon(Icons.place),
                title: Text("Llocs i trajectes")
            ),
            ListTile(
                leading: Icon(Icons.settings),
                title: Text("Configuració")
            ),
            Divider(color: Colors.grey),
            ListTile(title:Text("Atenció al client")),
            ListTile(title:Text("Xarxes socials")),
            ListTile(title:Text("TMBgo")),
            ListTile(title:Text("Bitllets i tarifes")),
            Divider(color: Colors.grey),
            ListTile(title:Text("Política de protecció de dades"))
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  Future<void> GroupalVoyages() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Trajectes grupals"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.group_add),
                      title: Text("Crear un trajecte grupal"),
                    ),
                    ListTile(
                      leading: Icon(Icons.qr_code_scanner),
                      title: Text("Uneix-te mitjançant un codi"),
                    )
                  ],
                ),
              )
          );
        }
    );
  }
  Future<void> DisplayMap() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Mapa"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image(image: NetworkImage("https://th.bing.com/th/id/OIP.8xHVhv-TGtTEd-5sbVYNEQHaFR?pid=ImgDet&rs=1"))
              ],
            )
          ),
        );
      }
    );
  }
}