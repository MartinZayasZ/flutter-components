
import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final List<String>opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: ListView(
        children: _crearItemsMetodoCorto()/*<Widget>[
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Title'),
          ),
          Divider(),
          ListTile(
            title: Text('ListTile Title'),
          ),
        ],*/
      )
    );

  }

  /*List<Widget> _crearItems(){

    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) { 
      final tempWidget = ListTile(
        title: Text( opt ),
      );
      lista..add( tempWidget )
            ..add( Divider() );
    }
    return lista;
  }*/

  List<Widget> _crearItemsMetodoCorto(){
     return opciones.map(( item ) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text('item-$item'),
            subtitle: Text('Hola mundo'),
            leading: Icon(Icons.work),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }


}