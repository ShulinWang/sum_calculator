import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Simple Calculator Demo',
      home: new HomePage(title: 'Simple Calculator Demo'),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, this.title}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController num1controller = new TextEditingController();
  TextEditingController num2controller = new TextEditingController();
  TextEditingController num3controller = new TextEditingController();
  String result = "0";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new TextField(
                  decoration: new InputDecoration(labelText: "Enter the 1st number:"),
                  keyboardType: TextInputType.number,
                  controller: num1controller,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                ),
              new TextField(
                decoration: new InputDecoration(labelText: "Enter the 2nd number:"),
                keyboardType: TextInputType.number,
                controller: num2controller,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ], // Only numbers can be entered
              ),
              new TextField(
                decoration: new InputDecoration(labelText: "Enter the 3rd number:"),
                keyboardType: TextInputType.number,
                controller: num3controller,
                // Only numbers can be entered
              ),
                SizedBox(height: 30),
                new FlatButton(
                  color:Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(8.0),
                  splashColor: Colors.blueAccent,
                  onPressed: (){
                    setState(() {
                      int sum=int.parse(num1controller.text)+int.parse(num2controller.text)+int.parse(num3controller.text);
                      result=sum.toString();
                    });
                  },
                  child: Text(
                    "Calculate",
                    style: TextStyle(fontSize:20.0),
                  ),
                ),
                SizedBox(height: 30),
                new Text(
                  result,
                  style: TextStyle(fontSize: 45),
                )
              ],
            ),
          )
      ),
    );
  }
}