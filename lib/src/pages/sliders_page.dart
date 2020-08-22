import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  static final pageName = 'slider';
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 10.0;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sliders')),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _createSlider(),
            _createCheckBox(),
            _creteSwitch(),
            Expanded(child: _createImage())
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
      activeColor: Colors.indigoAccent[100],
      label: 'Image size',
      divisions: 50,
      value: _sliderValue,
      min: 10.0,
      max: 400.0,
      onChanged:
          _blockCheck ? (value) => setState(() => _sliderValue = value) : null,
    );
  }

  Widget _createImage() {
    return Image(
        width: _sliderValue,
        fit: BoxFit.contain,
        image: NetworkImage(
            'https://i2.wp.com/mpcdigital.net/blog/wp-content/uploads/2006/10/carlojesu.jpg?w=525&ssl=1'));
  }

  Widget _createCheckBox() {
    // return Checkbox(
    //   value: _blockCheck,
    //   onChanged: (value) => setState(() => _blockCheck = value),
    // );
    return CheckboxListTile(
      title: _blockCheck ? Text('Block slide') : Text('Unblock slide'),
      value: _blockCheck,
      onChanged: (value) => setState(() => _blockCheck = value),
    );
  }

  Widget _creteSwitch() {
    return SwitchListTile(
      title: _blockCheck ? Text('Block slide') : Text('Unblock slide'),
      value: _blockCheck,
      onChanged: (value) => setState(() => _blockCheck = value),
    );
  }
}
