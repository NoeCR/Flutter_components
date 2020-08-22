import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  static final pageName = 'inputs';
  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  String _name;
  String _email;
  String _password;
  String _date;
  String _selectedHobbie = 'read';

  List<String> _hobbies = ['swim', 'read', 'music', 'travel'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _fieldName(),
          Divider(),
          _fieldEmail(),
          Divider(),
          _fieldPassword(),
          Divider(),
          _fieldDate(context),
          Divider(),
          _dropdown(),
          Divider(),
          _createPerson()
        ],
      ),
    );
  }

  Widget _fieldName() {
    return TextField(
      autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          counter: Text('Words ${_name != null ? _name.length : 0}'),
          hintText: 'Insert name',
          labelText: 'Name',
          helperText: 'Type only name',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)),
      onChanged: (value) => setState(() => _name = value),
    );
  }

  Widget _fieldEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Insert email',
          labelText: 'Email',
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email)),
      onChanged: (value) => setState(() => _email = value),
    );
  }

  Widget _fieldPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Insert password',
          labelText: 'Password',
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock)),
      onChanged: (value) => setState(() => _password = value),
    );
  }

  Widget _fieldDate(BuildContext context) {
    return TextField(
      controller: _inputFieldDateController,
      enableInteractiveSelection: false,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: 'Pick date',
          labelText: 'Date',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2019),
        lastDate: new DateTime(2025));
    if (picked != null) {
      setState(() {
        _date = picked.toString();
        _inputFieldDateController.text = _date;
      });
    }
  }

  List<DropdownMenuItem<String>> getDropdownOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _hobbies.forEach((hoby) {
      list.add(DropdownMenuItem(child: Text(hoby), value: hoby));
    });

    return list;
  }

  Widget _dropdown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
            child: DropdownButton(
          value: _selectedHobbie,
          items: getDropdownOptions(),
          onChanged: (opt) {
            setState(() {
              _selectedHobbie = opt;
            });
          },
        ))
      ],
    );
  }

  Widget _createPerson() {
    return ListTile(
      title: Text(
          'Name: $_name \nEmail: $_email \nPassword: $_password \nDate picked: $_date \nHobbie $_selectedHobbie'),
    );
  }
}
