import 'package:flutter/cupertino.dart';
import 'package:rick_demo_project/core/utils/fake_characters_list.dart';
import 'package:rick_demo_project/data/models/presentation/character_card_presentation_model.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/character_card.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CharactersCardListView extends StatelessWidget{
  final bool canLoadMore;
  final bool isLoading;
  final void Function() onLoadMore;
  final void Function(int characterId) onToggleFavorite;
  final List<CharacterCardPresentationModel> characters;

  const CharactersCardListView({super.key, required this.canLoadMore, required this.isLoading, required this.characters, required this.onToggleFavorite, required this.onLoadMore});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: canLoadMore && characters.isNotEmpty ? characters.length + 2 : characters.length,
      itemBuilder: (context, index){
        if (index >= characters.length - 1 && canLoadMore && !isLoading) {
          onLoadMore();
        }
        if(index >= characters.length){
          return Skeletonizer(child: CharacterCard(character: fakeCharactersList.first));
        }
        final character = characters[index];
        return CharacterCard(
          character: character,
          onToggleFavorite: () => onToggleFavorite(character.id),
        );
      },
    );
  }
}