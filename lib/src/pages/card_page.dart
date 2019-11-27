import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0,),
          _cardTipo2()
        ],
      )
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Soy un título'),
            subtitle: Text('ASDKLÑSDASDAKLÑSDAKLÑKLÑDAKLÑDAKLÑDAKLÑKLÑDAKLÑKLÑDAKLÑAKLÑDALÑKLÑDLÑKDALÑKASDSDAKLÑSÑAKLDASKLÑDASKLÑDSAKDSAKLÑD'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Cancelar'),
                onPressed: (){},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: (){},
              )
            ],
          )
        ],
      ),
    );
  }

  _cardTipo2() {
    final _card =  Card(
      
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250.0,
            fit: BoxFit.cover,
          ),
          /*Image(
            image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/8/81/Parque_Eagle_River%2C_Anchorage%2C_Alaska%2C_Estados_Unidos%2C_2017-09-01%2C_DD_02.jpg'),
          )<,*/
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Título de imagen'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        child: _card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }

}