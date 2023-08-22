import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/data/questions_provider.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final questionProvider = Provider.of<QuestionsProvider>(context, listen: false);
    return Scaffold(
      appBar: myAppBar(context, 'Bem Vindo ${questionProvider.username}'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 32.0),
              child: Text('O que deseja fazer?', style: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            UserActionButton(
              icon: Icons.add,
              text: '   Iniciar novo questionário',
              color: MyTheme.primaryColor,
              action: (() => {questionProvider.newCurrentQuestion = 1, Navigator.pushReplacementNamed(context, 'quiz')})
            ),
            UserActionButton(
              icon: Icons.history,
              text: '   Ver histórico',
              color: MyTheme.secondaryColor,
              action: (() {Navigator.pushNamed(context, 'history');})
            ),
            UserActionButton(
                icon: Icons.logout,
                text: '   Sair',
                color: MyTheme.dangerColor,
                action: (() {Navigator.pushReplacementNamed(context, 'home');})
            ),
          ],
        ),
      ),
    );
  }
}

class UserActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Function() action;
  const UserActionButton({super.key, required this.icon, required this.text, required this.color, required this.action});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MyTheme().customElevatedButton(
          function: action,
          backgroundColor: color,
          child: Row(
            children: [
              Icon(icon),
              Text(text, style: const TextStyle(fontWeight: FontWeight.bold),)
            ],
        )
      ),
    );
  }
}

