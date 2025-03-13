import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_demo_project/domain/entities/character_domain_model.dart';

class SingleCharacterView extends StatelessWidget{
  final CharacterModel character;
  final void Function()? onToggle;

  const SingleCharacterView({super.key, required this.character, this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? 'Unknown Character'),
        actions: onToggle != null ? [
          IconButton(
            icon: Icon(
              character.favorite == true ? Icons.star : Icons.star_border,
              color: character.favorite == true ? Colors.green : Colors.grey,
            ),
            onPressed: onToggle,
          ),
        ] : [],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (character.image != null)
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80),
                  child: CachedNetworkImage(
                    imageUrl: character.image ?? 'https://via.placeholder.com/150',
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey[300],
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 80,
                      width: 80,
                      color: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 20),

            if (character.name != null)
              Text(character.name!,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            const SizedBox(height: 10),

            if (character.status != null || character.species != null)
              Text('${character.status ?? 'Unknown'} - ${character.species ?? 'Unknown'}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            const SizedBox(height: 20),

            const Text('Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildDetailRow('Type', character.type),
            _buildDetailRow('Gender', character.gender),
            _buildDetailRow('Origin', character.origin),
            _buildDetailRow('Location', character.location),
            const SizedBox(height: 20),

            if (character.episodes != null && character.episodes!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Episodes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  ...?character.episodes?.map((episode) => Text(episode)),
                ],
              ),
            const SizedBox(height: 20),

            // Created Date
            if (character.created != null)
              Text('Created: ${character.created}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDetailRow(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(value ?? 'Unknown'),
        ),
      ],
    ),
  );
}
