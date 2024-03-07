import 'dart:async';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color nuBlue = Color(0xFF003366);
  static const Color nuGold = Color(0xFFFDD023);

  static ThemeData themeData = ThemeData(
    fontFamily: 'PressStart2P',
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      accentColor: Color(0xFFFDD023), // NU Gold color
    ),
    scaffoldBackgroundColor: nuBlue, // Change background color to nuBlue
    appBarTheme: AppBarTheme(
      backgroundColor: nuBlue,
      elevation: 0,
      toolbarTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'PressStart2P',
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'PressStart2P',
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: nuGold,
        onPrimary: Colors.white,
        textStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'PressStart2P',
        ),
        padding: EdgeInsets.all(20), // Increase button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: nuGold,
        textStyle: TextStyle(
          fontSize: 20,
          fontFamily: 'PressStart2P',
        ),
      ),
    ),
  );
}


class QuizScreen extends StatefulWidget {
  final String category;

  QuizScreen({required this.category});

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _score = 0;
  late List<Map<String, dynamic>> _questions = [];
  late Timer _timer;
  int _timeLeft = 10;
  bool _triviaShown = false; // Flag to track if trivia dialog is shown
  bool _triviaDialogShown = false; // Track if trivia dialog is shown

  @override
  void initState() {
    super.initState();
    _loadQuestions();
    _startTimer();
  }

  void _loadQuestions() {
  switch (widget.category) {
    case 'NU History':
  _questions = [
        {
      'question': 'When did National University move to its current location in Sampaloc, Manila?',
      'answers': [
        {'text': '1935', 'correct': false},
        {
          'text': '1928',
          'correct': true,
          'trivia': 'Correct! National University moved to its current location in Sampaloc, Manila, in 1928.',
          'image': 'assets/picture1.png', 
        },
        {'text': '1945', 'correct': false},
        {'text': '1955', 'correct': false},
      ],
    },
    {
      'question': 'Which department was the first to offer a graduate program at National University?',
      'answers': [

        {'text': 'College of Education', 'correct': false},
        {'text': 'College of Engineering', 'correct': false},
        {
          'text': 'College of Business and Public Administration',
          'correct': true,
          'trivia': 'Correct! The College of Business and Public Administration was the first to offer a graduate program at National University.',
          'image': 'assets/picture2.png', 
        },
        {'text': 'College of Dentistry', 'correct': false},
      ],
    },
    {
      'question': 'Who was the founder of National University?',
      'answers': [
        {
          'text': 'Don Mariano Fortunato Jhocson',
          'correct': true,
          'trivia': 'Correct! Don Mariano Fortunato Jhocson was the founder of National University.',
          'image': 'assets/picture3.png', 
        },
        {'text': 'Don Antonio Jhocson', 'correct': false},
        {'text': 'Don Santiago Jhocson', 'correct': false},
        {'text': 'Don Pedro Jhocson', 'correct': false},
      ],
    },
    {
      'question': 'Which National University program was the first to receive Level III accreditation from the PAASCU?',
      'answers': [    
        {'text': 'College of Education', 'correct': false},
        {'text': 'College of Dentistry', 'correct': false},
        {'text': 'Graduate School of Business and Public Administration', 'correct': false},
        {
          'text': 'College of Engineering',
          'correct': true,
          'trivia': 'Correct! The College of Engineering was the first National University program to receive Level III accreditation from the PAASCU.',
          'image': 'assets/picture4.png', 
        },
      ],
    },
    {
      'question': 'What is the name of National University\'s official student publication?',
      'answers': [
        
        {'text': 'The National Chronicle', 'correct': false},
        {'text': 'The NU Times', 'correct': false},
        {
          'text': 'The Central Student Goverment',
          'correct': true,
          'trivia': 'Correct! The Central Student Goverment is the official student publication of National University.',
          'image': 'assets/picture5.png', 
        },
        {'text': 'The Sampaloc Gazette', 'correct': false},
      ],
    },
  ];
  break;
    case 'Famous Alumni':
  _questions = [
        {
      'question': 'Who served as the 12th President of the Philippines and graduated as the 8th placer in the Civil Engineering Licensure Examination in 1953?',
      'answers': [
        {'text': 'Carlos P. Garcia', 'correct': false},
        {'text': 'Roy Cimatu', 'correct': false},
        {
          'text': 'Fidel V. Ramos',
          'correct': true,
          'trivia': 'Correct! Fidel V. Ramos served as the 12th President of the Philippines and graduated as the 8th placer in the Civil Engineering Licensure Examination in 1953.',
          'image': 'assets/picture6.png', 
        },
        {'text': 'Neptali Gonzales, Sr.', 'correct': false},
      ],
    },
    {
      'question': 'Who is the 8th President of the Philippines and earned a Law Degree in National University in 1923?',
      'answers': [
        {
          'text': 'Carlos P. Garcia',
          'correct': true,
          'trivia': 'Correct! Carlos P. Garcia, the 8th President of the Philippines, earned a Law Degree in National University in 1923.',
          'image': 'assets/picture7.png', 
        },
        {'text': 'Fidel V. Ramos', 'correct': false},
        {'text': 'Neptali Gonzales, Sr.', 'correct': false},
        {'text': 'Nemesio Yabut', 'correct': false},
      ],
    },
    {
      'question': 'Who is the 9th President of the Philippines and earned a Law Degree in National University',
      'answers': [
        {'text': 'Nicanor Faeldon', 'correct': false},
        {
          'text': 'Diosdado P. Macapagal',
          'correct': true,
          'trivia': 'Correct! Diosdado P. Macapagal served as the 9th President of the Philippines.',
          'image': 'assets/picture8.png', 
        },
        {'text': 'Bernardo M. Vergara', 'correct': false},
        {'text': 'Mamintal Adiong, Sr.', 'correct': false},
      ],
    },
    {
      'question': 'Whos the Comedian and Actor Alumni?',
      'answers': [
        {'text': 'Wally Bayola', 'correct': false},
        {'text': 'Jose Manalo', 'correct': false},
        {'text': 'Paolo Cuntis', 'correct': false},
        {
          'text': 'Joey De Leon',
          'correct': true,
          'trivia': 'Correct! Joey De Leon is a alumni from National University.',
          'image': 'assets/picture9.png', 
        },
      ],
    },
    {
      'question': 'Who is the National Artist of the Philippines for Literature?',
      'answers': [
        {'text': 'Roxlee', 'correct': false},
        {'text': 'Jewel Ponferada', 'correct': false},
        {
          'text': 'Nestor Vicente Madali Gonzalez',
          'correct': true,
          'trivia': 'Correct! Nestor Vicente Madali Gonzalez is the National Artist of the Philippines for Literature.',
          'image': 'assets/picture10.png', 
        },
        {'text': 'Dave Wilson Yu', 'correct': false},
      ],
    },
      ];
      break;
    case 'Campus Milestone':
      _questions = [
        {
          'question': 'When was National University founded, and what was its original name?',
          'answers': [
            {
              'text': '1900, Colegio Filipino',
              'correct': true,
              'trivia':
              'Correct! National University was originally named Colegio Filipino when it was founded in 1900.',
              'image': 'assets/picture11.png', 
            },
            {'text': '1800, University of Manila', 'correct': false},
            {'text': '1950, Manila Central University', 'correct': false},
            {'text': '2000, Philippine National University', 'correct': false},
          ],
        },
        {
          'question': 'In what year was National University granted university status?',
          'answers': [
            {'text': '1943', 'correct': false},
            {
              'text': '1921',
              'correct': true,
              'trivia':
              'Correct! National University was granted university status in 1921.',
              'image': 'assets/picture12.png',  
            },
            {'text': '1960', 'correct': false},
            {'text': '2001', 'correct': false},
          ],
        },
        {
          'question': 'Who founded National University Manila?',
          'answers': [
            {'text': 'Emilio Aguinaldo', 'correct': false},
            {'text': 'Jose Rizal', 'correct': false},
            {'text': 'Andres Bonifacio', 'correct': false},
            {
              'text': 'Mariano Fortunato Jhocson',
              'correct': true,
              'trivia':
              'Correct! National University Manila was founded by Mariano Fortunato Jhocson.',
              'image': 'assets/picture3.png',      
            },
          ],
        },
        {
          'question': 'In 2008, what group acquired majority ownership of National University?',
          'answers': [
            {'text': 'Globe Telecom Inc.', 'correct': false},
            {'text': 'San Miguel Corporation', 'correct': false},
             {
              'text': 'SM Group of Companies',
              'correct': true,
              'trivia':
              'Correct! In 2008, the SM Group of Companies acquired majority ownership of National University.',
              'image': 'assets/picture13.png', 
            },
            {'text': 'Ayala land', 'correct': false},
          ],
        },
        {
          'question': 'A new logo for National University was unveiled on what date?',
          'answers': [

            {'text': 'September 21, 2012', 'correct': false},
            {
              'text': 'October 17, 2017',
              'correct': true,
              'trivia':
              'Correct! The new logo for National University was unveiled on October 17, 2017.',
              'image': 'assets/picture14.png', 
            },
            {'text': 'June 8, 2011', 'correct': false},
            {'text': 'January 30, 2017', 'correct': false},
          ],
        },
      ];
      break;
    case 'Legacy of NU':
      _questions = [
        {
          'question': 'What is the official motto of National University?',
          'answers': [
            {'text': 'Service is the number one priorities', 'correct': false},
            {'text': 'Provided with care', 'correct': false},
            {'text': 'Education is the future', 'correct': false},
            {
              'text': 'Education that works',
              'correct': true,
              'trivia':
              'Correct! The official motto of National University is "Education that works".',
              'image': 'assets/picture15.png',  
            },
          ],
        },
        {
          'question': 'What are the official colors of National University?',
          'answers': [
            {'text': 'Red and White', 'correct': false},
            {'text': 'Green and Gold', 'correct': false},
            {
              'text': 'Blue and Gold',
              'correct': true,
              'trivia':
              'Correct! The official colors of National University are Blue and Gold".',
              'image': 'assets/picture16.png', 
            },
            {'text': 'Black and Yellow', 'correct': false},
          ],
        },
        {
        'question': 'Which NU campus is the first one established outside Metro Manila?',
        'answers': [
          {'text': 'NU Fairview', 'correct': false},
          {
              'text': 'NU Bacolod',
              'correct': true,
              'trivia': 'Correct! NU Bacolod is the first NU campus established outside Metro Manila.',
              'image': 'assets/picture17.png', 
          },
          {'text': 'NU Clark', 'correct': false},
          {'text': 'NU Baliwag', 'correct': false},
         ],
        },
        {
          'question': 'When did National University open its doors to students at its Laguna campus?',
          'answers': [
            {'text': '2016-2017', 'correct': false},
            {
              'text': '2018-2019',
              'correct': true,
              'trivia':
              'Correct! National University opened its doors to students at its Laguna campus in the 2018–2019 school year.',
              'image': 'assets/picture18.png', 
            },
            {'text': '2020-2021', 'correct': false},
            {'text': '2022-2023', 'correct': false},
          ],
        },
        {
          'question': 'Which NU campus is known for its collaboration with INSPIRE Sports Academy?',
          'answers': [
            {'text': 'NU Fairview', 'correct': false},
        
            {'text': 'NU Manila', 'correct': false},
            {'text': 'NU Clark', 'correct': false},
            {
              'text': 'NU Laguna',
              'correct': true,
              'trivia':
              'Correct! NU Laguna is known for its collaboration with INSPIRE Sports Academy, offering programs related to sports education and training.',
              'image': 'assets/picture19.png',     
            },
          ],
        },
      ];
      break;
  }
 // Shuffle questions within each category
  _questions.shuffle();
}

  void _answerQuestion(bool isCorrect) {
  setState(() {
    if (isCorrect) {
      _score++;
      _showTriviaDialog(); // Show trivia if the answer is correct
    } else {
      _nextQuestion(); // Move to the next question regardless of the answer
    }
  });
}

 void _showTriviaDialog() {
  setState(() {
    _triviaShown = true; // Set flag to true when trivia dialog is shown
  });
  _showTrivia(_questions[_questionIndex]['answers']
      .firstWhere((answer) => answer['correct'] == true)['trivia']);
}

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
      _timeLeft = 10;
      for (int i = 0; i < _questions.length; i++) {
        for (int j = 0; j < _questions[i]['answers'].length; j++) {
          _questions[i]['answers'][j]['answered'] = false;
        }
      }
    });
    _startTimer();
  }

  void _startTimer() {
  _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    setState(() {
      if (_timeLeft > 0) {
        _timeLeft--;
      } else {
        _timer.cancel(); // Cancel the current timer
        _timeLeft = 10; // Reset the time left to 10 seconds
        if (_questionIndex < _questions.length - 1) {
          _questionIndex++; // Move to the next question if available
          _startTimer(); // Start a new timer for the next question
        } else {
          // If all questions are answered, cancel the timer
          _timer.cancel();
        }
      }
    });
  });
}

   void _nextQuestion() {
  setState(() {
    _questionIndex++; // Move to the next question
    _timeLeft = 10; // Reset the time left for the new question

    // Reset flags and cancel timer if all questions are answered
    if (_questionIndex >= _questions.length) {
      _triviaShown = false;
      _triviaDialogShown = false;
      _timer.cancel();
    } else {
      _triviaShown = false; // Reset flag when moving to the next question
      _triviaDialogShown = false; // Reset trivia dialog shown flag
    }
  });
}

 @override
Widget build(BuildContext context) {
  return Theme(
    data: AppTheme.themeData,
    child: Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category,
          style: TextStyle(
            fontFamily: 'PressStart2P',
          ),
        ),
      ),
      body: _questionIndex < _questions.length
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors
                          .white, // White container for questions and choices
                      borderRadius: BorderRadius.circular(40),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          'Question ${_questionIndex + 1} of ${_questions.length}', // Display question number
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'PressStart2P'),
                        ),
                        SizedBox(height: 20),
                        Text(
                          _questions[_questionIndex]['question'],
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'PressStart2P'),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Time left: $_timeLeft seconds',
                          style: TextStyle(fontSize: 18, fontFamily: 'PressStart2P'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors
                            .white, // White container for questions and choices
                        borderRadius: BorderRadius.circular(40),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: (_questions[_questionIndex]['answers']
                                as List<Map<String, dynamic>>)
                            .map((answer) {
                          bool isAnswered = answer['answered'] ?? false;
                          Color buttonColor = isAnswered
                              ? (answer['correct']
                                  ? Colors.green
                                  : Colors.red)
                              : AppTheme.nuGold;
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(vertical: 10.0),
                            child: ElevatedButton(
                              onPressed: isAnswered
                                  ? null
                                  : () {
                                      _answerQuestion(answer['correct']);
                                      _showTrivia(answer['trivia']);
                                      setState(() {
                                        answer['answered'] = true;
                                      });
                                    },
                              style: ElevatedButton.styleFrom(
                                primary: buttonColor,
                                onPrimary: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                textStyle: TextStyle(fontSize: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: Container(
                                width: double
                                    .infinity, // Make the button flexible
                                padding:
                                    EdgeInsets.all(5), // Padding of 5px
                                child: Center(
                                  child: Text(
                                    answer['text'],
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontFamily: 'PressStart2P'),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have completed the quiz!',
                        style: TextStyle(fontSize: 20, fontFamily: 'PressStart2P'),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Your Score: $_score/${_questions.length}',
                        style: TextStyle(fontSize: 16, fontFamily: 'PressStart2P'),
                      ),
                      SizedBox(height: 20),
                     ElevatedButton(
                      onPressed: _resetQuiz,
                      child: Text(
                        'Restart Quiz',
                        style: TextStyle(
                          fontFamily: 'PressStart2P',
                          fontSize: 11, // Adjust the font size here
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



  void _showTrivia(String? trivia) {
  if (trivia != null && !_triviaDialogShown) {
    _triviaDialogShown = true; // Set trivia dialog shown to true
    _timer.cancel(); // Pause the timer
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(child: Text('Trivia', style: TextStyle(fontFamily: 'PressStart2P', fontSize: 20))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                trivia,
                style: TextStyle(fontFamily: 'PressStart2P', fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            if (_triviaShown && _questions[_questionIndex]['answers']
                .any((answer) => answer['correct'] == true && answer.containsKey('image')))
              Center(
                child: Image.asset(
                  _questions[_questionIndex]['answers']
                      .firstWhere((answer) => answer['correct'] == true && answer.containsKey('image'))['image'],
                  width: 500, // Increase the width of the image to make it bigger
                ),
              ),
          ],
        ),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
                _triviaDialogShown = false; // Set trivia dialog shown back to false
                _nextQuestion(); // Move to the next question after dismissing trivia dialog
                _startTimer(); // Resume the timer
              },
              child: Text('Okay', style: TextStyle(fontFamily: 'PressStart2P', fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}





  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
