import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dashboard.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  var Music =  AudioPlayer();
      
  @override
  void initState() {

    Music.play(AssetSource('images/load.wav'));

    Future.delayed(Duration(seconds: 4)).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=> Dashboard()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/1.5,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    image: DecorationImage(
                      image: AssetImage('assets/images/loader.png'),
                    )
                ),
              ),
          SpinKitFadingCircle(
            color: Colors.white,
            size: 50.0,
          ),
              SizedBox(
                height: 30,
              ),
              Text('Designed by Nath', style: TextStyle(color: Colors.white),),
            ],
          ),
        )
    );
  }
}


