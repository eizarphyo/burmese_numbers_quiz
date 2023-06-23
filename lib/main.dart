import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BurmeseQuiz(),
    );
  }
}

class BurmeseQuiz extends StatefulWidget {
  const BurmeseQuiz({super.key});

  @override
  State<BurmeseQuiz> createState() => _BurmeseQuizState();
}

class _BurmeseQuizState extends State<BurmeseQuiz> {
  var burmeseNum1 = 6;
  var burmeseNum2 = 8;
  var burmeseNum3 = 9;
  var burmeseNum4 = 3;

  var burmeseNums = [];
  var engNum = 9;
  int points = 0;
  double progressVal = 0;

  void generateNums() {
    burmeseNums = [];

    Random random = Random();
    int randomNum = random.nextInt(9) + 1;
    burmeseNums.add(randomNum);

    int counter = 0;
    while (counter < 3) {
      randomNum = random.nextInt(9) + 1;
      bool isSameNum = false;
      for (int i = 0; i < burmeseNums.length; i++) {
        if (randomNum == burmeseNums[i]) {
          isSameNum = true;
          break;
        }
      }
      if (!isSameNum) {
        burmeseNums.add(randomNum);
        counter++;
      }
    }
    burmeseNum1 = burmeseNums[0];
    burmeseNum2 = burmeseNums[1];
    burmeseNum3 = burmeseNums[2];
    burmeseNum4 = burmeseNums[3];

    burmeseNums.shuffle();
    engNum = burmeseNums[0];
  }

  SnackBar snackBar = SnackBar(content: Container());

  void checkAnswer(int chosenNum) {
    if (chosenNum == engNum) {
      snackBar = SnackBar(
        content: const Text("Your answer is correct!"),
        backgroundColor: Colors.brown.shade400,
        duration: const Duration(milliseconds: 500),
      );
      points += 10;
      progressVal += 0.1;
    } else {
      snackBar = SnackBar(
        content: const Text("Your answer is incorrect."),
        backgroundColor: Colors.brown.shade400,
        duration: const Duration(milliseconds: 500),
      );
    }

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   "Learn Burmese Numbers",
        //   style: TextStyle(fontSize: 20),
        // ),
        // backgroundColor: Colors.brown.shade300,
        toolbarHeight: 8,
      ),
      body: Center(
        child: Column(
          children: [
            LinearProgressIndicator(
              value: progressVal,
              color: Colors.brown.shade400,
              minHeight: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      points < 100
                          ? Text(
                              "Choose Number $engNum",
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : const Text(
                              "Congratulations 🎉",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Text("Your points: $points"),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              // splashColor: Colors.brown.shade50,
                              // radius: 35,
                              onTap: () {
                                if (points < 100) {
                                  debugPrint("Tapped 1");
                                  checkAnswer(burmeseNum1);
                                  generateNums();
                                  setState(() {});
                                } else {
                                  null;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.brown.shade300),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage("images/$burmeseNum1.png"),
                                  width: 150,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              // splashColor: Colors.brown.shade50,
                              // radius: 35,
                              onTap: () {
                                if (points < 100) {
                                  debugPrint("Tapped 2");
                                  checkAnswer(burmeseNum2);

                                  generateNums();
                                  setState(() {});
                                } else {
                                  null;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.brown.shade300),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage("images/$burmeseNum2.png"),
                                  width: 150,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              // splashColor: Colors.brown.shade50,
                              radius: 35,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              onTap: () {
                                if (points < 100) {
                                  debugPrint("Tapped 3");
                                  checkAnswer(burmeseNum3);

                                  generateNums();
                                  setState(() {});
                                } else {
                                  null;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.brown.shade300),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage("images/$burmeseNum3.png"),
                                  width: 150,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              // splashColor: Colors.brown.shade50,
                              // radius: 35,
                              onTap: () {
                                if (points < 100) {
                                  debugPrint("Tapped 4");
                                  checkAnswer(burmeseNum4);
                                  generateNums();
                                  setState(() {});
                                } else {
                                  null;
                                }
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.brown.shade300),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage("images/$burmeseNum4.png"),
                                  width: 150,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  points != 100
                      ? Container()
                      : ElevatedButton(
                          onPressed: () {
                            points = 0;
                            progressVal = 0;
                            generateNums();
                            setState(() {});
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll<Color>(
                                Colors.brown.shade50),
                            shape: MaterialStateProperty.all(
                              const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Restart",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
