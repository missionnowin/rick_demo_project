import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timer_button/timer_button.dart';

class LoadingErrorWidget extends StatelessWidget{
  final void Function() onError;

  const LoadingErrorWidget({super.key, required this.onError});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4,),
            TimerButton.builder(
                builder: (context, time){
                  return const AutoSizeText.rich(
                      TextSpan(
                          children:[
                            TextSpan(
                                text: 'Произошла ошибка. ',
                            ),
                            TextSpan(
                                text: 'Повторить',
                                style: TextStyle(color: Colors.blue)
                            )
                          ]
                      )
                  );
                },
                onPressed: onError,
                timeOutInSeconds: 3
            )
          ],
        )
    );
  }
}