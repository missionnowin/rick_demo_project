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
            character.favorite == true ? Icons.favorite : Icons.favorite_border,
            color: character.favorite == true ? Colors.red : null,
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
            // Character Image
            if (character.image != null)
              Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(character.image!),
                  radius: 80,
                ),
              ),
            const SizedBox(height: 20),

            // Name
            if (character.name != null)
              Text(
                character.name!,
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
            const SizedBox(height: 10),

            // Status and Species
            if (character.status != null || character.species != null)
              Text(
                '${character.status ?? 'Unknown'} - ${character.species ??
                    'Unknown'}',
                style: Theme
                    .of(context)
                    .textTheme
                    .titleMedium,
              ),
            const SizedBox(height: 20),

            // Details Section
            const Text(
              'Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),
            _buildDetailRow('Type', character.type),
            _buildDetailRow('Gender', character.gender),
            _buildDetailRow('Origin', character.origin),
            _buildDetailRow('Location', character.location),
            const SizedBox(height: 20),

            // Episodes Section
            if (character.episodes != null && character.episodes!.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Episodes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(),
                  ...character.episodes!
                      .map((episode) => Text(episode))
                      .toList(),
                ],
              ),
            const SizedBox(height: 20),

            // Created Date
            if (character.created != null)
              Text(
                'Created: ${character.created}',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
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
