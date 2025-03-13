import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_demo_project/core/utils/fake_characters_list.dart';
import 'package:rick_demo_project/presentation/blocs/single_character/single_character_bloc.dart';
import 'package:rick_demo_project/presentation/ui/views/character_view.dart';
import 'package:rick_demo_project/presentation/ui/widgets/common/error_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SingleCharacterPage extends StatelessWidget {
  final int characterId;

  const SingleCharacterPage({super.key, required this.characterId});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SingleCharacterBloc, SingleCharacterState>(
        listener: (context, state){
          if(state is SingleCharacterTogglingError){
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.message)
                )
            );
          }
        },
        builder: (context, state){
          if(state is SingleCharacterLoaded){
            return SingleCharacterView(
                character: state.character,
                onToggle: () => context.read<SingleCharacterBloc>().add(ToggleFavoriteEvent(state.character))
            );
          }
          if(state is SingleCharacterLoading){
            return Skeletonizer(
                child: SingleCharacterView(
                    character: fakeCharacterModel.first
                )
            );
          }
          if(state is SingleCharacterError){
            return Scaffold(
              body: Center(
                  child: LoadingErrorWidget(
                    onError: () => context.read<SingleCharacterBloc>().add(FetchSingleCharacterEvent(characterId)),
                  )
              ),
            );
          }
          return const Scaffold();
        },
    );
  }
}