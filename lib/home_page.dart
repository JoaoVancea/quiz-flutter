import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_quiz/quizMarinho.dart';
import 'package:projeto_quiz/quizTerrestre.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuizNovais', style: GoogleFonts.nunitoSans(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: false,
        actions: const [
            Icon(Icons.search)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Desafie \nsua mente', style: GoogleFonts.arimo(fontSize: 40, fontWeight: FontWeight.bold))
          ),
          SizedBox(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50)),
                  child: Text('Todos', style: GoogleFonts.roboto()),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Image.asset('assets/animais.png', width: 50, height: 50),
                      Text('Animais', style: GoogleFonts.roboto(color: Colors.white))
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Image.asset('assets/astronomia.png', width: 50, height: 50),
                      Text('Astronomia', style: GoogleFonts.roboto())
                    ],
                  ),
                ),
                Container(
                  width: 150,
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      Image.asset('assets/tecnologia.png', width: 50, height: 50),
                      Text('Tecnologia', style: GoogleFonts.roboto())
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(16),
            height: 300,
            width: double.infinity,
            child: GestureDetector(
              onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const QuizMarinho())),
              child: Card(
                color: Colors.blue[50],
                elevation: 4,
                child: Column(
                  children: [
                    Image.asset('assets/golfinho.png', width: 150, height: 150),
                    Text('Mostre seu conhecimento \nmarítimo!',
                    style: GoogleFonts.indieFlower(fontSize: 24, fontWeight: FontWeight.bold)),
                    ListTile(
                      leading: const Icon(Icons.star, color: Colors.amberAccent),
                      title: Text('1500 pontos', style: GoogleFonts.roboto(fontWeight: FontWeight.w300)),
                    )
                  ],
                  ),
              ),
            ),
          ),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 100,
                  width: 200,
                  child: GestureDetector(
                    onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (_)=> const QuizTerrestre())),
                    child: Card(
                      color: Colors.green[50],
                      elevation: 4,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/sapo.png', width: 50, height: 50),
                          ),
                          Text('Mostre seu conhecimento \nterrestre!',
                            style: GoogleFonts.indieFlower(fontSize: 16, fontWeight: FontWeight.bold)),
                          ListTile(
                            leading: const Icon(Icons.star, color: Colors.amberAccent),
                            title: Text('1500 pontos', style: GoogleFonts.roboto(fontWeight: FontWeight.w300)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 100,
                  width: 200,
                  child: Card(
                    color: Colors.blueGrey[100],
                    elevation: 4,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/tucano.png', width: 50, height: 50),  
                        ),
                        Text('Mostre seu conhecimento \naéreo!',
                          style: GoogleFonts.indieFlower(fontSize: 16, fontWeight: FontWeight.bold)),
                        ListTile(
                          leading: const Icon(Icons.star, color: Colors.amberAccent),
                          title: Text('1200 pontos', style: GoogleFonts.roboto(fontWeight: FontWeight.w300)),
                        )
                      ],
                    ),
                  ),
                )              
              ],
            ),
          )
        ],
      )
    );
  }
}