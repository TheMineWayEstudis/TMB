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

class PaginaMapa extends StatefulWidget {
  PaginaMapa({Key key, this.title}) : super(key:key);
  final String title;

  @override
  _PaginaMapa createState() => _PaginaMapa();
}
class _PaginaMapa extends State<PaginaMapa> {
  bool busSwitched = true, rutasSwitched = true, paradesSwitched = true, turistSwitched = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa interactiu"),
      ),
      body: ListView(
        children: <Widget>[
          Image(image: NetworkImage("https://www.freecountrymaps.com/map/free/spain/badalona-map-spain-52228684.png")),
          SwitchListTile(value: busSwitched, title: Text("Mostrar autobusos"), onChanged: (value) {
            busSwitched = value;
            setState(() {});
          }),
          SwitchListTile(value: rutasSwitched, title: Text("Mostrar rutes"), onChanged: (value) {
            rutasSwitched = value;
            setState(() {});
          }),
          SwitchListTile(value: paradesSwitched, title: Text("Mostrar parades"), onChanged: (value) {
            paradesSwitched = value;
            setState(() {});
          }),
          SwitchListTile(value: turistSwitched, title: Text("Mostrar punts culturals"), onChanged: (value) {
            turistSwitched = value;
            setState(() {});
          }),
        ],
      ),
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
              onTap: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ComArribar()));
              },
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
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => PaginaMapa()));
              },
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
                    ),
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

class ComArribar extends StatefulWidget {
  ComArribar({Key key, this.title}) : super (key:key);
  final String title;

  @override
  _ComArribar createState() => _ComArribar();
}
class _ComArribar extends State<ComArribar> {
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Com arribar"),
      ),
      body: ListView(
        children: <Widget>[
          Image(image: NetworkImage("https://www.freecountrymaps.com/map/free/spain/badalona-map-spain-52228684.png")),
          TextField(
            decoration: InputDecoration(
              hintText: "Origen",
            ),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Destí",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showTimePicker(
                  context: context, initialTime: TimeOfDay.now()
              );
            },
            child: Text("Seleccionar hora de sortida"),
          ),
          ElevatedButton(
            onPressed: () {
              showTimePicker(
                  context: context, initialTime: TimeOfDay.now()
              );
            },
            child: Text("Seleccionar hora d'arribada"),
          )
        ],
      ),
    );
  }
}