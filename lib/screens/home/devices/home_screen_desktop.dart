import 'package:fast_trivia/commons/my_appbar.dart';
import 'package:fast_trivia/data/questions_provider.dart';
import 'package:fast_trivia/themes/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenDesktop extends StatelessWidget {
  HomeScreenDesktop({super.key});

  final TextEditingController textEditingController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Fast Trivia'),
      body: Center(
        child: Form(
          key: formKey,
          child: Container(
            width: MediaQuery.of(context).size.width * .25,
            height: MediaQuery.of(context).size.height * .4,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: MyTheme.questionContainerColor,
              borderRadius: BorderRadius.circular(14),
              boxShadow: kElevationToShadow[2]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  children: [
                    Text('Bem Vindo ao\nFast Trivia!', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    Text('Insira seu nome para começar', style: TextStyle(fontSize: 18),),
                  ],
                ),
                SizedBox(
                    width: 290,
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: const InputDecoration(
                        hintText: 'digite seu nome...',
                      ),
                      validator: (String? value) {
                        if(value != null) {
                          if(value.isEmpty) {
                            return 'Por favor preencha seu nome';
                          }
                        }

                        return null;
                      },
                    )
                ),
                MyTheme().customElevatedButton(
                    function: (() {
                      if(formKey.currentState!.validate()) {
                        final questionProvider = Provider.of<QuestionsProvider>(context, listen: false);
                        final username = textEditingController.text;
                        questionProvider.newUsername = username;
                        Navigator.pushReplacementNamed(context, 'user', arguments: {"username": username});
                      }
                    }),
                    backgroundColor: MyTheme.primaryColor,
                    child: const Text('Entrar', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
