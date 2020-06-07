import 'package:flutter/material.dart';

class Motivo {
  int id;
  String nombre;

  Motivo(this.id, this.nombre);

  static List<Motivo> getMotivos() {
    return <Motivo>[
      Motivo(1, 'Nueva idea'),
      Motivo(2, 'Opinion/Consejo'),
      Motivo(3, 'Error'),
      Motivo(4, 'Otros'),
    ];
  }
}

class NewRequestPage extends StatefulWidget {
  @override
  _NewRequestPageState createState() => _NewRequestPageState();
}

class _NewRequestPageState extends State<NewRequestPage> {
  List<Motivo> _motivos = Motivo.getMotivos();
  List<DropdownMenuItem<Motivo>> _dropdownMenuItems;
  Motivo _selectedMotivo;
  String _descripcion;
  String _fecha = '';

  final _formkey = GlobalKey<FormState>();

  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  void initState() {
    _dropdownMenuItems = buildDropdownMenuItems(_motivos);
    _selectedMotivo = _dropdownMenuItems[0].value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nueva Solicitud')),
      body: ListView(
        children: <Widget>[
          _formulario(context),
        ],
      ),
    );
  }

  Widget _tituloField() {
    return TextFormField(
        maxLength: 100,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            labelText: 'Titulo'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'El titulo no puedo estar vacio';
          }
        },
        onSaved: (String value) {
          _descripcion = value;
        });
  }

  Widget _motivodrop() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Seleccione el motivo:"),
                SizedBox(width: screenSize.width * 0.03),
                DropdownButton(
                  value: _selectedMotivo,
                  items: _dropdownMenuItems,
                  onChanged: onChangeDropdownItem,
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  onChangeDropdownItem(Motivo selectedMotivo) {
    setState(() {
      _selectedMotivo = selectedMotivo;
    });
  }

  Widget _calendario(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        hintText: 'Fecha',
        labelText: 'Fecha',
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selecDate(context);
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'La fecha no puede estar vacio';
        }
      },
    );
  }

  _selecDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        locale: Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  Widget _descripcionField() {
    return TextFormField(
        keyboardType: TextInputType.multiline,
        minLines: 5,
        maxLines: null,
        maxLength: 500,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            labelText: 'Descripción'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'La descripción no puedo estar vacio';
          }
        },
        onSaved: (String value) {
          _descripcion = value;
        });
  }

  List<DropdownMenuItem<Motivo>> buildDropdownMenuItems(List motivos) {
    List<DropdownMenuItem<Motivo>> items = List();
    for (Motivo motivo in motivos) {
      items.add(
        DropdownMenuItem(
          value: motivo,
          child: Text(motivo.nombre),
        ),
      );
    }
    return items;
  }

  Widget _formulario(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.92,
      margin: EdgeInsets.all(24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 20.0,
            )
          ]),
      child: _solicitud(context),
    );
  }

  Widget _solicitud(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 30),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            _tituloField(),
            Divider(
              color: Colors.transparent,
            ),
            _motivodrop(),
            Divider(
              color: Colors.transparent,
            ),
            _calendario(context),
            Divider(
              color: Colors.transparent,
            ),
            _descripcionField(),
            SizedBox(
              height: 39,
            ),
            RaisedButton(
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.transparent, width: 1),
                ),
                child: Text('Confirmar',
                    style: TextStyle(color: Color(0xff32a05f), fontSize: 16)),
                onPressed: () {
                  if (!_formkey.currentState.validate()) {
                    return;
                  }
                  _formkey.currentState.save();

                  print(_selectedMotivo.nombre);
                  print(_fecha);
                  print(_descripcion);
                  // print(_telefono);
                  // print(_correo);
                })
          ],
        ),
      ),
    );
  }
}
