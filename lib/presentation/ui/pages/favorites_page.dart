import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/presentation/blocs/favorite_characters/favorite_characters_bloc.dart';

class FavoritesPage extends StatelessWidget{
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<FavoriteCharactersBloc, FavoriteCharactersState>(
        listener: (context, state){
          if(state is FavoriteCharactersLoadedError){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message)
                )
            );
          }
        },
        builder: (context, state){
          if(state is FavoriteCharactersLoaded){

          }
          if(state is FavoriteCharactersLoading){

          }
          if(state is FavoriteCharactersError){

          }
          return Container();
        },
      ),
    );
  }
}