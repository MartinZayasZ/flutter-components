
import 'package:flutter/material.dart';


class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 200.0;

  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _crearCheckbox(),
            _crearSwitch(),
            Expanded(child: _crearImagen())
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {

    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      min: 10.0,
      max: 500.0,
      value: _valorSlider,
      onChanged: (_bloquearCheck) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );

  }

  Widget _crearCheckbox() {
    /*return Checkbox(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );*/
    return CheckboxListTile(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
      title: Text('Bloquear Slider'),
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
      value: _bloquearCheck,
      onChanged: (valor){
        setState(() {
          _bloquearCheck = valor;
        });
      },
      title: Text('Bloquear Slider'),
    );
  }


  Widget _crearImagen() {
    return Image(
      image: NetworkImage('https://www.sideshow.com/storage/product-images/9049231/iron-man-mark-lxxxv-battle-damaged-version-special-edition_marvel_silo.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }



  
}