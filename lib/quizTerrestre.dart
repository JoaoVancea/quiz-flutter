import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizTerrestre extends StatefulWidget {
  const QuizTerrestre({super.key});

  @override
  State<QuizTerrestre> createState() => _QuizState();
}

class _QuizState extends State<QuizTerrestre> {
  int currentQuestionIndex = 0; // Índice da pergunta atual
  String? selectedAnswer;
  bool? isCorret;
  final List<Map<String, dynamic>> questions = [
    {
      'question':
          'Qual destes animais terrestres é conhecido por sua tromba longa e flexível?',
      'answers': ['Leão', 'Elefante', 'Girafa', 'Zebra'],
      'correctAnswer': 'Elefante'
    },
    {
      'question':
          'Qual destes animais terrestres é o mamífero mais rápido do mundo?',
      'answers': ['Leopardo', 'Guepardo', 'Leão', 'Gorila'],
      'correctAnswer': 'Guepardo'
    },
    {
      'question':
        'Qual destes animais terrestres é um marsupial e é encontrado principalmente na Austrália?',
      'answers': ['Leão', 'Canguru', 'Lobo', 'Tigre'],
      'correctAnswer': 'Canguru'
    }
    //Adicione mais perguntas aqui
  ];

  void nextQuestion() {
    selectedAnswer = null;
    isCorret = null;
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      //Fim do Quiz, fazer algo aqui
      
    }
  }

  void handleAnswer(String answer) {
    setState(() {
      selectedAnswer = answer; 
      isCorret = answer == questions[currentQuestionIndex]['correctAnswer'];  
    });

    Future.delayed(Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz terrestre!', style: GoogleFonts.roboto(fontWeight: FontWeight.bold))
        ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center (
              child: Text(currentQuestion['question'],
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18), ),
            ),
          ),
          Wrap(
            children: currentQuestion['answers'].map<Widget>((resposta) {
              bool isSelected = selectedAnswer == resposta;
              Color? buttonColor;
              if (isSelected) {
                buttonColor = isCorret! ? Colors.green : Colors.red;
              }

              return meuBtn(
                resposta, () => handleAnswer(resposta), buttonColor);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) => 
  Container(
    margin: const EdgeInsets.all(16),
    width: 160,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(resposta),
    ),
  );