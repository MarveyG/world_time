import 'package:flutter/material.dart';

import '../services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png', isDaytime: true),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png', isDaytime: true),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png', isDaytime: true),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png', isDaytime: true),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png', isDaytime: true),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png', isDaytime: true),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png', isDaytime: true),
    WorldTime(url: 'Europe/Belgium', location: 'Belgium', flag: 'belgium.png', isDaytime: true),
    WorldTime(url: 'Asia/Israel', location: 'Israel', flag: 'israel.png', isDaytime: true),
    WorldTime(url: 'Asia/China', location: 'China', flag: 'china.png', isDaytime: true),
    WorldTime(url: 'Asia/Japan', location: 'Japan', flag: 'japan.jpeg', isDaytime: true),
    WorldTime(url: 'Europe/Russia', location: 'Russia', flag: 'russia.png', isDaytime: true),
    WorldTime(url: 'Europe/Italy', location: 'Italy', flag: 'italy.png', isDaytime: true),
    WorldTime(url: 'Asia/North_Korea', location: 'North Korea', flag: 'north_korea.png', isDaytime: true),
  ];

  void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  // int counter = 0;
  @override
  Widget build(BuildContext context) {
    //print('build function ran');
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                   updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
