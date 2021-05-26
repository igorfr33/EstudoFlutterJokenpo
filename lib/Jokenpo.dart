import 'dart:math';

import 'package:flutter/material.dart';

class Jokenpo extends StatefulWidget {
  @override
  _JokenpoState createState() => _JokenpoState();
}

class _JokenpoState extends State<Jokenpo> {

var _imagemApp = AssetImage("images/padrao.png");
var _mensagem = "Escolha uma opção abaixo";

 void opcaoSelecionada(String escolhaUsuario){

   var opcoes = ["pedra", "papel", "tesoura"];
   var numero = Random().nextInt(3);
   var escolhaApp = opcoes[numero];

   switch(escolhaApp){
     case "pedra":
     setState(() {
      this._imagemApp = AssetImage("images/pedra.png");
     });
     break;
     
     case "papel":
     setState(() {
       this._imagemApp = AssetImage("images/papel.png");
     });
   break;

      case "tesoura":
      setState(() {
        this._imagemApp = AssetImage("images/tesoura.png");
      });
      break;
   }

    if(escolhaUsuario == "pedra" && escolhaApp =="tesoura" || escolhaUsuario == "tesoura" && escolhaApp == "papel" || escolhaUsuario == "papel" && escolhaApp == "pedra"){
      setState(() {
        this._mensagem = "Parabéns!!! Você Ganhou.";
      });
    }
    else if(escolhaApp == "pedra" && escolhaUsuario == "tesoura" || escolhaApp == "tesoura" && escolhaUsuario == "papel" || escolhaApp == "papel" && escolhaUsuario == "pedra"){
      setState(() {
        this._mensagem = "Vitória do App";
      });
    }

    else{
      setState(() {
        this._mensagem = "Empate";
      });
    }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokenpo",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Text(
            "Escolha do App",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom:16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png"),
              ),
              GestureDetector(
                onTap: ()=> opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png"),
              ),
              GestureDetector(
                onTap: ()=> opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png"),
              ),
            ],
          ),
        ],
        ),
      
    );
  }
}