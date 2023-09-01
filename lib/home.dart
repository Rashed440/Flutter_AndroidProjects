import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String bgImage = ' ';
  int val = 0;
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;
    bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    val = data['isDaytime'] ? 700 : 200;
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/$bgImage'), fit: BoxFit.cover)),
        child: Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 250.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'location': result['location'],
                        'flag': result['flag'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location),
                  label: Text(
                    'Set & set Location',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['location'],
                        style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.0,
                            color: Colors.grey[200])),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.grey[val]),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
