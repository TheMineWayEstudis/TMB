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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: AppBar(
        title: Text("TMB"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.place),
              title: Text("Cómo llegar"),
              subtitle: Text("Indica qué trayecto quieres realizar"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.gps_fixed),
              title: Text("Dónde estoy"),
              subtitle: Text("Te mostraremos las paradas más cercanas"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus),
              title: Text("iBus-iMetro"),
              subtitle: Text("Consulta el tiempo de espera en la parada o estación"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.local_activity),
              title: Text("Billetes"),
              subtitle: Text("Ya puedes comprar billetes desde la app"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text("Trayectos grupales"),
              subtitle: Text("Coordina los trayectos de varias personas"),
              onTap: () => GroupalVoyages(),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.map),
              title: Text("Mapa"),
              subtitle: Text("Observa la zona"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_bus, color: Colors.red,),
              title: Text("Líneas de bus"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_railway, color: Colors.red,),
              title: Text("Líneas de metro"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.warning, color: Colors.red,),
              title: Text("Avisos de servicio"),
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
              title: Text("Mis billetes"),
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text("Historial de compras"),
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Métodos de pago"),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Mis favoritos"),
            ),
            ListTile(
              leading: Icon(Icons.place),
              title: Text("Lugares y trayectos")
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Configuración")
            ),
            Divider(color: Colors.grey),
            ListTile(title:Text("Atención al cliente")),
            ListTile(title:Text("Redes sociales")),
            ListTile(title:Text("TMBgo")),
            ListTile(title:Text("Billetes y tarifas")),
            Divider(color: Colors.grey),
            ListTile(title:Text("Política de protección de datos"))
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
            title: Text("Trayectos grupales"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.group_add),
                    title: Text("Crear un trayecto grupal"),
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_scanner),
                    title: Text("Unirse mediante un código"),
                  )
                ],
              ),
            )
          );
        }
    );
  }
}