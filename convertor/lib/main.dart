import 'package:flutter/material.dart';

void main() {
  runApp(ConvertorApp());
}

class ConvertorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Convertor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConvertorPage(title: "Currency Convertor"),
    );
  }
}

class ConvertorPage extends StatefulWidget {
  ConvertorPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ConvertorPageState createState() => _ConvertorPageState();
}

class _ConvertorPageState extends State<ConvertorPage> {
  TextEditingController _amountController = new TextEditingController();
  final _form = GlobalKey<FormState>();
  String _result = "";

  void _convertAmount() {
    setState(() {
      if (!_form.currentState.validate()) {
        _result = "";
        return;
      }

      _result = (double.parse(_amountController.text) * 4.92).toStringAsFixed(2) + " RON";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Form(
        key: _form,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                'images/money.jpeg',
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Enter the amount in EUR',
                ),
                validator: (text) {
                  if (text.isEmpty || double.tryParse(text) == null) {
                    return "Please enter a number!";
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, bottom: 30.0),
                child: FlatButton(
                  onPressed: _convertAmount,
                  child: Text(
                    'CONVERT!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: Colors.lightGreen,
                ),
              ),
              Text(
                '$_result',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
