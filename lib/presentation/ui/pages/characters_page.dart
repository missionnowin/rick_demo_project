import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/core/utils/fake_characters_list.dart';
import 'package:rick_demo_project/presentation/blocs/characters/characters_bloc.dart';
import 'package:rick_demo_project/presentation/ui/views/characters_card_list.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/character_card.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharactersPage extends StatelessWidget{
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<CharactersBloc, CharactersState>(
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
                return CharactersCardList(
                    canLoadMore: state.canLoadMore,
                    isLoading: state.isLoading,
                    characters: state.characters,
                    onToggleFavorite: (characterId) => context.read<CharactersBloc>().add(ToggleFavoriteCharacterEvent(characterId)),
                    onLoadMore: () => context.read<CharactersBloc>().add(LoadMoreCharactersEvent()),
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
      ),
    );
  }
}