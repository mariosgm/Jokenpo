import 'dart:math';
import 'package:flutter/material.dart';

class PptPage extends StatefulWidget {
  @override
  _PptPageState createState(){
    return _PptPageState();
  } 
}

class _PptPageState extends State<PptPage> {
  String imageJogador = 'assets/images/games.png';
  String imagePc = 'assets/images/games.png';
  int numeroJogador;
  int numeroPc;
  String resposta = 'Inicie o game com uma escolha !';


 
  
void pedra() {
    String imageJogador ='assets/images/pedra.png';
    numeroJogador = 0;
    var random = Random();
    numeroPc = random.nextInt(3);
    resposta = resultadoJogo(numeroJogador, numeroPc);
    if(numeroPc == 0){
      imagePc = 'assets/images/pedra.png';
    }
    else if(numeroPc == 1){
      imagePc = 'assets/images/papel.png';
    }
    else{
      imagePc = 'assets/images/tesoura.png';
    }
    setState(() {
      this.imageJogador = imageJogador;
      this.imagePc = imagePc;
      this.resposta = resposta;
    });
  }

  void papel() {
    String imageJogador ='assets/images/papel.png';
    numeroJogador = 1;
    var random = Random();
    numeroPc = random.nextInt(3);
    resposta = resultadoJogo(numeroJogador, numeroPc);
    if(numeroPc == 0){
      imagePc = 'assets/images/pedra.png';
    }
    else if(numeroPc == 1){
      imagePc = 'assets/images/papel.png';
    }
    else{
      imagePc = 'assets/images/tesoura.png';
    }
    setState(() {
      this.imageJogador = imageJogador;
      this.imagePc = imagePc;
      this.resposta = resposta;
    });

  }
    void tesoura() {
    String imageJogador ='assets/images/tesoura.png';
    numeroJogador = 2;
    var random = Random();
    numeroPc = random.nextInt(3);
    print(numeroJogador);
    print(numeroPc);
    resposta = resultadoJogo(numeroJogador, numeroPc);
    if(numeroPc == 0){
      imagePc = 'assets/images/pedra.png';
    }
    else if(numeroPc == 1){
      imagePc = 'assets/images/papel.png';
    }
    else{
      imagePc = 'assets/images/tesoura.png';
    }
    setState(() {
      this.imageJogador = imageJogador;
      this.imagePc = imagePc;
      this.resposta = resposta;
    });
  }




  String resultadoJogo(int numeroJogador, int numeroBot){
    if(numeroBot == numeroJogador){
      return 'Empate';
    }
    else if(numeroBot == 2 && numeroJogador == 0 || numeroBot == 1 && numeroJogador == 2 || numeroBot == 0 && numeroJogador == 1){
      return 'Vitória';
    }
    else if(numeroJogador == 0 && numeroBot == 1 || numeroJogador == 1 && numeroBot == 2 || numeroJogador == 2 && numeroBot == 0){
      return 'Derrota';
    }
    else{
      return 'Resultado aparecerá aqui';
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Joguinho'),
        centerTitle: true,
        elevation: double.infinity,
      ),
      body: Row(
        children: [
          Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget> [
                    Padding(
                      padding: EdgeInsets.only(left: 20), 
                      child: ElevatedButton(
                      child: Text(
                        'Pedra',
                        style: TextStyle(color: Colors.brown, fontSize: 25), 
                      ), 
                      onPressed: pedra,
                      style: ElevatedButton.styleFrom(primary:Colors.yellow),
                    ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 10), 
                      child: ElevatedButton(
                      child: Text(
                        'Papel',
                        style: TextStyle(color: Colors.brown, fontSize: 25), 
                      ), 
                      onPressed: papel,
                      style: ElevatedButton.styleFrom(primary:Colors.yellow),
                    ),
                    ),Padding(
                      padding: EdgeInsets.only(left: 20, top: 10), 
                      child: ElevatedButton(
                      child: Text(
                        'Tesoura',
                        style: TextStyle(color: Colors.brown, fontSize: 25), 
                      ), 
                      onPressed: tesoura,
                      style: ElevatedButton.styleFrom(primary:Colors.yellow),
                    ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Image.asset(imageJogador),
                )
              ),
              Flexible(
                flex: null,
                child: Center(
                  child: Text(' VS '),
                )
              ),
              Flexible(
                flex: 1,
                child: Center(
                  child: Image.asset(imagePc),
                )
              ),
              Flexible(
                flex: 1,
                  child: Center(
                    child: Text('$resposta'),
                  )
              )
        ],
      ),
    );
  }
}