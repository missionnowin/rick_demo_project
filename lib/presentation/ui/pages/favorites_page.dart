import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/core/utils/fake_characters_list.dart';
import 'package:rick_demo_project/presentation/blocs/favorite_characters/favorite_characters_bloc.dart';
import 'package:rick_demo_project/presentation/ui/views/characters_card_list_view.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/character_card.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FavoritesPage extends StatelessWidget{
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<FavoriteCharactersBloc, FavoriteCharactersState>(
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
              return CharactersCardListView(
                canLoadMore: state.canLoadMore,
                isLoading: state.isLoading,
                characters: state.favoriteCharacters,
                onToggleFavorite: (characterId) => context.read<FavoriteCharactersBloc>().add(RemoveCharacterFromFavoriteEvent(characterId)),
                onLoadMore: () => context.read<FavoriteCharactersBloc>().add(LoadMoreFavoriteCharactersEvent()),
              );
            }
            if(state is FavoriteCharactersLoading){
              return Skeletonizer(
                child: ListView.builder(
                  itemCount: fakeCharactersList.length,
                  itemBuilder: (context, index) {
                    return CharacterCard(character: fakeCharactersList[index]);
                  },
                ),
              );
            }
            if(state is FavoriteCharactersError){
              return Center(
                child: LoadingErrorWidget(
                    onError: () => context.read<FavoriteCharactersBloc>().add(FetchFavoriteCharactersEvent())
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}