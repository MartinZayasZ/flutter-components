import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Hombre';

  TextEditingController _inputFieldDateController =  new TextEditingController();

  List<String> _poderes = ['Hombre','Mujer','Ninguno'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(),
          Divider(),
          _crearDropDown(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre',
        labelText: 'Nombre',
        helperText: 'Ej. Martin Zayas',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nombre'),
      subtitle: Text('Email es: $_email'),
    );
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Ej. mzayas@somos.mx',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email)
      ),
      onChanged: (valor) => setState(() => _email = valor)
    );
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_email.length}'),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Ej. mzayas@somos.mx',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock)
      ),
      onChanged: (valor) => setState(() => _email = valor)
    );
  }

  Widget _crearFecha() {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha',
        labelText: 'Fecha',
        suffixIcon: Icon(Icons.calendar_today),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      firstDate: new DateTime(2018),
      initialDate: new DateTime.now(),
      lastDate: new DateTime(2025),
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }

  }


  List<DropdownMenuItem<String>> getOpcionesDropDown(){
    List<DropdownMenuItem<String>> lista = new List();
    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });
    return lista;
  }

  Widget _crearDropDown() {
    return Row(children: <Widget>[
      Icon(Icons.select_all),
      SizedBox(width: 30.0),
      Expanded(
        child: DropdownButton(
          value: _opcionSeleccionada,
          items: getOpcionesDropDown(),
          onChanged: (opt){
            print(opt);
            setState(() {
              _opcionSeleccionada = opt;
            });
          },
        ),
      )
    ],);
    
    
  }
  

}