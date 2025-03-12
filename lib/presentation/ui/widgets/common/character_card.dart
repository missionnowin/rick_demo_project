import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rick_demo_project/presentation/models/character_presentation_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterPresentationModel character;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CharacterCard({super.key, required this.character, this.onAdd, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: character.image ?? 'https://via.placeholder.com/150',
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 150,
                color: Colors.grey[300],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 150,
                color: Colors.grey[300],
                child: const Icon(Icons.error, color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    AutoSizeText(
                      character.name ?? 'Unknown',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: (){
                        if(character.favorite == true && onAdd != null){
                          onAdd!();
                        }else if(onRemove != null){
                          onRemove!();
                        }
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Icon(Icons.favorite, color: character.favorite == true ? Colors.green : Colors.red),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                AutoSizeText(
                  '${character.status ?? 'Unknown'} - ${character.species ?? 'Unknown'}',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                // Location
                AutoSizeText(
                  'Location: ${character.location ?? 'Unknown'}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}