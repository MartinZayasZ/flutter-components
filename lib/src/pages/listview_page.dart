import 'dart:async';

import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  //necesario para el scroll infinito
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  bool _isLoading = false;

  @override
  void initState() {//para al iniciar mandar a llamar las imágenes
    super.initState();
    _agregar10();

    //necesario para el scroll infinito
    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        _fetchData();
        //_agregar10();
      }
    });
  }

  @override
  void dispose() {//necesario para infiniti scroll, debido a que el scrollcontroller se queda abierto al salir
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List View')),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading()
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _agregar10();
        },
      ),*/
    );
  }

  Widget _crearLista(){
    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index){
        final _imagen = _listaNumeros[index];
        _ultimoItem = _imagen;
        return FadeInImage(
          image: NetworkImage('https://picsum.photos/200/300?random=${_imagen}'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        );
      },
    );
  }


  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future<Null> _fetchData() async{
    _isLoading = true;
    setState(() {});

    return Timer(Duration(seconds:2),(){
      _isLoading = false;
      _scrollController.animateTo(
        _scrollController.position.pixels+100,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250)
      );//mover el scroll
      _agregar10();
    });
    
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
          SizedBox(height: 15.0,)
        ],
      );
    }else{
      return Container();
    }
  }

}