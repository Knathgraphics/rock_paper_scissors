import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Music = AudioPlayer();
  int ComputerScore = 0;
  int UserScore = 0;
  String result = '';
  List Options = ['Rock', 'Paper', 'Scissors', 'Rock', 'Paper', 'Scissors'];
  String ComOption = '';
  String ComImage = 'assets/images/nullimage.png';
  String UserImage = 'assets/images/nullimage.png';
  List Images = [
    'assets/images/rock.png',
    'assets/images/paper.png',
    'assets/images/scissors.png'
  ];

  void SelectOption() {
    Random ran = Random();
    ComOption = Options[ran.nextInt(6)];
    if (ComOption == 'Rock') {
      ComImage = Images[0];
    } else if (ComOption == 'Paper') {
      ComImage = Images[1];
    } else if (ComOption == 'Scissors') {
      ComImage = Images[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        elevation: 0,
        centerTitle: true,
        title: Text('Nath\'s Rock-Paper-Scissors',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi there 🎊',
                style: GoogleFonts.poppins(),
              ),
              Text(
                'I\'m Nathie your friendly bot, I\'ll be hear to play Rock-Paper-Scissors with you',
                style: GoogleFonts.poppins(color: Colors.grey),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.2 ?? 350,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.deepOrangeAccent],
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 30,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(5, 7))
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset('assets/images/bots.png'),
                            radius: 20,
                            backgroundColor: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Player 1 - Nathie',
                            style: GoogleFonts.poppins(
                                fontSize: 12, color: Colors.white),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        ComImage,
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Score (Nathie $ComputerScore  - $UserScore You)',
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        result,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Image.asset(
                        UserImage,
                        height: MediaQuery.of(context).size.height / 12,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Player 2 - You',
                        style: GoogleFonts.poppins(
                            fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'Make your Choice 😎',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectOption();
                        UserImage = Images[0];

                        if (ComOption == 'Rock') {
                          result = "Tie! Nathie Chose Rock too 😑";
                        } else if (ComOption == 'Paper') {
                          Music.play(AssetSource('assets/images/error.mp3'));
                          Music.play(AssetSource('images/error.mp3'));
                          result = "You Lose! 😢, Nathie Chose Paper";
                          ComputerScore++;
                        } else if (ComOption == 'Scissors') {
                          Music.play(AssetSource('images/success.mp3'));
                          result = "You Win! 🎊, Nathie Chose Scissors";
                          UserScore++;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/rock.png',
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectOption();
                        UserImage = Images[1];

                        if (ComOption == 'Rock') {
                          Music.play(AssetSource('images/success.mp3'));
                          result = "You Win! 🎊, Nathie Chose Rock";
                          UserScore++;
                        } else if (ComOption == 'Paper') {
                          result = "Tie! Nathie Chose Paper too 😑";
                        } else if (ComOption == 'Scissors') {
                          Music.play(AssetSource('images/error.mp3'));
                          result = "You Lose! 😢, Nathie Chose Scissors";
                          ComputerScore++;
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/paper.png',
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        SelectOption();
                        UserImage = Images[2];
                        if (ComOption == 'Rock') {
                          Music.play(AssetSource('images/error.mp3'));
                          result = "You Lose! 😢, Nathie Chose Rock";
                          ComputerScore++;
                        } else if (ComOption == 'Paper') {
                          Music.play(AssetSource('images/success.mp3'));
                          result = "You Win! 🎊, Nathie Chose Paper";
                          UserScore++;
                        } else if (ComOption == 'Scissors') {
                          result = "Tie! Nathie Chose Scissors too 😑";
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.3),
                          borderRadius: BorderRadius.circular(7)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/scissors.png',
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'HOW TO PLAY: Rock wins against scissors; paper wins against rock; and scissors wins against paper. If both players throw the same hand signal, it is considered a tie, and play resumes until there is a clear winner.',
                style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 546,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              ComputerScore = UserScore = 0;
              result = '';
            });
          },
          backgroundColor: Colors.orange,
          label: Text(
            'Restart Game',
            style: TextStyle(color: Colors.black),
          ),
          icon: Icon(
            Icons.restart_alt_sharp,
            color: Colors.black,
          )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
