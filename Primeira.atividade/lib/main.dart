import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: TelaEscolha()));
}

class TelaEscolha extends StatefulWidget {
  @override
  _TelaEscolhaState createState() => _TelaEscolhaState();
}

class _TelaEscolhaState extends State<TelaEscolha> {
  final List<String> opcoes = ['pedra', 'papel', 'tesoura'];

  // Função que gera uma escolha aleatória para o computador
  String gerarEscolhaComputador() {
    final random = Random();
    return opcoes[random.nextInt(3)];
  }

  // Função que verifica o resultado do jogo
  String verificarResultado(String escolhaUsuario, String escolhaComputador) {
    if (escolhaUsuario == escolhaComputador) {
      return 'Empate';
    } else if ((escolhaUsuario == 'pedra' && escolhaComputador == 'tesoura') ||
        (escolhaUsuario == 'papel' && escolhaComputador == 'pedra') ||
        (escolhaUsuario == 'tesoura' && escolhaComputador == 'papel')) {
      return 'Vitória';
    } else {
      return 'Derrota';
    }
  }

  void jogar(String escolhaUsuario) {
    String escolhaComputador = gerarEscolhaComputador();
    String resultado = verificarResultado(escolhaUsuario, escolhaComputador);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => TelaResultado(
              escolhaUsuario: escolhaUsuario,
              escolhaComputador: escolhaComputador,
              resultado: resultado,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pedra, Papel e Tesoura'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Escolha sua opção:', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => jogar('pedra'),
                  child: Image.asset(
                    'assets/pedra.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => jogar('papel'),
                  child: Image.asset(
                    'assets/papel.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () => jogar('tesoura'),
                  child: Image.asset(
                    'assets/tesoura.png',
                    width: 100,
                    height: 100,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TelaResultado extends StatelessWidget {
  final String escolhaUsuario;
  final String escolhaComputador;
  final String resultado;

  TelaResultado({
    required this.escolhaUsuario,
    required this.escolhaComputador,
    required this.resultado,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resultado'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Sua escolha: $escolhaUsuario',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Escolha do computador: $escolhaComputador',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Jogar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
