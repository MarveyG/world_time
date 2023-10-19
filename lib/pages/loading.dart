import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'home.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

 // String time = 'loading';

  Future<void> setupWorldTime () async {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin', isDaytime: true);
    await instance.getTime();
    if(context.mounted) {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    }
    if (kDebugMode) {
      print('Location: ${instance.location}');
    }
    if (kDebugMode) {
      print('Flag: ${instance.flag}');
    }
    if (kDebugMode) {
      print('Time: ${instance.time}');
    }

    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {

   // SpinKitRotatingCircle spinkit;
    return  Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}


