import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:timer_button/timer_button.dart';

class LoadingErrorWidget extends StatelessWidget{
  final void Function() onError;
  final String? errorText;

  const LoadingErrorWidget({super.key, required this.onError, this.errorText});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 4,),
            TimerButton.builder(
                builder: (context, time){
                  return AutoSizeText.rich(
                      TextSpan(
                          children:[
                            TextSpan(
                                text: 'An error occurred. ${errorText ?? ''}',
                            ),
                            const TextSpan(
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