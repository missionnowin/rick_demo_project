import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';

class CharactersPage extends StatelessWidget{
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<CharactersBloc, CharactersState>(
          listener: (context, state){
            if(state is CharactersLoadedError){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(state.message)
                  )
              );
            }
          },
          builder: (context, state){
            if(state is CharactersLoaded){

            }
            if(state is CharactersLoading){

            }
            if(state is CharactersError){

            }
            return Container();
          }
      ),
    );
  }
}