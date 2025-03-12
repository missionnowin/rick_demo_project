import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/core/utils/fake_characters_list.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/character_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../widgets/common/error_widget.dart';

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
              return ListView.builder(
                itemCount: state.canLoadMore ? state.characters.length : state.characters.length + 1,
                itemBuilder: (context, index){
                  if (index >= state.characters.length - 1 && state.canLoadMore && !state.isLoading) {
                    context.read<CharactersBloc>().add(LoadMoreCharactersEvent());
                  }
                  if(index >= state.characters.length){
                    return Skeletonizer(child: CharacterCard(character: fakeCharactersList.first));
                  }
                  return CharacterCard(character: state.characters[index]);
                },
              );
            }
            if(state is CharactersLoading){
              return Skeletonizer(
                child: ListView.builder(
                  itemCount: fakeCharactersList.length,
                  itemBuilder: (context, index) {
                    return CharacterCard(character: fakeCharactersList[index]);
                  },
                ),
              );
            }
            if(state is CharactersError){
              return Center(
                child: LoadingErrorWidget(
                    onError: () => context.read<CharactersBloc>().add(FetchCharactersEvent())
                ),
              );
            }
            return Container();
          }
      ),
    );
  }
}