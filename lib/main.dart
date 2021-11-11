import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color color = Colors.red;

  double tsize = 20;

  var top = 50.0;

  var left = 50.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Paint',
      home: const MyHomePage(title: 'Paint'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.red;
  double tsize = 20;
  var top = 50.0;
  var left = 50.0;
  var ttext = "Drag Me";
  TextEditingController emailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: SizedBox.expand(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      entertext(context);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13.0),
                      child: const Image(
                        image: AssetImage('assets/wallpaper.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      onPressed: () => pickColor(context),
                      child: const Text('Frame colour'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("hh");
                      entertext(context);
                    },
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: top,
                          left: left,
                          child:
                              // TextField(
                              //   style:
                              //       TextStyle(color: Colors.blue, fontSize: tsize),
                              //   decoration: InputDecoration(
                              //     hintText: "Drag me",
                              //     hintStyle:
                              //         TextStyle(fontSize: 20.0, color: Colors.blue),
                              //     border: OutlineInputBorder(),
                              //   ),
                              // ),
                              Text(
                            emailController.text,
                            style: TextStyle(
                              fontSize: tsize,
                              color: Colors.lightBlueAccent,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onVerticalDragUpdate: (DragUpdateDetails dd) {
                      setState(() {
                        top = dd.localPosition.dy;
                        left = dd.localPosition.dx;
                      });
                    },
                  ),
                  Positioned(
                    right: 5,
                    top: 50,
                    bottom: 100,
                    child: RotatedBox(
                      quarterTurns: 1,
                      child: Slider(
                        value: tsize,
                        onChanged: (double s) {
                          setState(() {
                            tsize = s;
                          });
                        },
                        activeColor: Colors.white60,
                        max: 40,
                        min: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColorPicker() => ColorPicker(
      pickerColor: color,
      onColorChanged: (color) => setState(
            () => this.color = color,
          ));

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Frame color'),
            content:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildColorPicker(),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'SELECT',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ));

  Widget buildtext() => TextField(
        controller: emailController,
        style: TextStyle(color: Colors.blue, fontSize: tsize),
        onChanged: (text) {
          print('First text field: $text');
          setState(
            () => this.emailController = emailController,
          );
        },
      );

  void entertext(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: const Text('Enter Text'),
            content:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              buildtext(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'SELECT',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ]),
          ));
}
