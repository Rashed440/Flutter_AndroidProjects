import 'package:flutter/material.dart';
import 'package:project_2/services/world_Time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: 'Dhaka', flag: 'dhaka.png', url: 'Asia/Dhaka'),
    WorldTime(location: 'Berlin', flag: 'uk.png', url: 'Europe/Berlin'),
    WorldTime(location: 'Chicago', flag: 'usa.png', url: 'America/Chicago'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();

    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Chossee Location'),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
          elevation: 0.0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location.toString()),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${locations[index].flag}'),
                ),
              ),
            );
          },
        ));
  }
}
