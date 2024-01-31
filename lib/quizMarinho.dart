import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_quiz/home_page.dart';g

class QuizMarinho extends StatefulWidget {
  const QuizMarinho({Key? key}) : super(key: key);

  @override
  State<QuizMarinho> createState() => _QuizState();
}

class _QuizState extends State<QuizMarinho> {
  int currentQuestionIndex = 0;
  int questoesAcertadas = 0;
  String? selectedAnswer;
  bool? isCorret;
  bool quizConcluido = false;
  String palavraQuestao = 'null';

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Qual destes animais é conhecido por sua impressionante capacidade de mudar de cor?',
      'answers': ['Golfinho', 'Polvo', 'Tubarão', 'Baleia'],
      'correctAnswer': 'Polvo'
    },
    {
      'question': 
        'Qual animal marinho é famoso por sua carapaça dura e longa vida?',
      'answers': [
        'Baleia Azul',
        'Caranguejo',
        'Tartaruga Marinha',
        'Estrela do Mar'
      ],
      'correctAnswer': 'Tartaruga Marinha'
    }
  ];

  void nextQuestion() {
    selectedAnswer = null;
    isCorret = null;

    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      setState(() {
        quizConcluido = true;
        Future.delayed(Duration(seconds: 5), () {
          Navigator.of(context).push(MaterialPageRoute(builder:(_)=> new HomePage()));
        });
      });
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
    String texto = questoesAcertadas == questions.length ? 'Você acertou todas as questões!' : 'Você acertou $questoesAcertadas $palavraQuestao!';
    int quantidadeQuestoes = questions.length;
    if (quizConcluido) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.blue[50],
            elevation: 4,
            child: Column(
              children: [
                Image.asset('assets/gifParabens.gif', width: 400, height: 300),
                Center(
                  child: Text('Você finalizou o quiz!\n$texto ($questoesAcertadas/$quantidadeQuestoes)',
                    style: GoogleFonts.roboto(fontSize: 32, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center
                  ),
                ),
              ],
            ),
          ),
          Text('Retornando para a página inicial...',
            style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 95, 93, 93), decoration: TextDecoration.none),
            textAlign: TextAlign.center
          ),
        ],
      );
    }

    var currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz marítimo!', style: GoogleFonts.roboto(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(18),
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Text(
                currentQuestion['question'],
                style: GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ),
          Wrap(
            children: currentQuestion['answers'].map<Widget>((resposta) {
              bool isSelected = selectedAnswer == resposta;
              Color? buttonColor;
              if (isSelected) {
                buttonColor = isCorret! ? Colors.green : Colors.red;
                isCorret! ? questoesAcertadas++ : null;
                palavraQuestao = questoesAcertadas == 1 ? 'questão' : 'questões';
              }

              return meuBtn(resposta, () => handleAnswer(resposta), buttonColor);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta, VoidCallback onPressed, Color? color) => Container(
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