import 'package:flashcard_app/flashcard.dart';
import 'package:flashcard_app/flashcard_view.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Flashcard> _flashcards = [
    Flashcard(question: "What language does flutter uses?", answer: "Dart"),
    Flashcard(question: "What language does React uses?", answer: "JavaScript"),
    Flashcard(question: "What language does Angular uses?", answer: "JavaScript"),
    Flashcard(question: "What language does Electron uses?", answer: "JavaScript"),
    Flashcard(question: "What language does React Native uses?", answer: "JavaScript")
  ];

  int _currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('FlashCard Quiz')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: FlipCard(
                  front: FlashcardView(text: _flashcards[_currIndex].question),
                  back: FlashcardView(text: _flashcards[_currIndex].answer)
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: previousCard, 
                    icon: Icon(Icons.chevron_left), 
                    label: Text('Prev')),
                  OutlinedButton.icon(
                    onPressed: nextCard, 
                    icon: Icon(Icons.chevron_right), 
                    label: Text('Next')),
                ]
              )
            ]
          ),
        )
      )
    );
  }
  void nextCard(){
    setState(() {
      _currIndex = (_currIndex + 1 < _flashcards.length) ? _currIndex + 1 : 0;
    });
  }
  void previousCard(){
    setState(() {
      _currIndex = (_currIndex - 1 >= 0) ? _currIndex - 1 : _flashcards.length - 1;
    });
  }
}