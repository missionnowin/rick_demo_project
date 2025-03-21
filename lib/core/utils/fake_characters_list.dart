import 'package:rick_demo_project/domain/entities/character_domain_model.dart';
import 'package:rick_demo_project/data/models/presentation/character_card_presentation_model.dart';

const fakeCharacterModel = [
  CharacterModel(
    id: 1,
    name: 'Rick Sanchez',
    favorite: true,
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  )
];

const fakeCharactersList = [
  CharacterCardPresentationModel(
    id: 1,
    name: 'Rick Sanchez',
    favorite: true,
    image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  ),
  CharacterCardPresentationModel(
    id: 2,
    name: 'Morty Smith',
    favorite: false,
    image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  ),
  CharacterCardPresentationModel(
    id: 3,
    name: 'Morty Smith',
    favorite: false,
    image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  ),
  CharacterCardPresentationModel(
    id: 4,
    name: 'Morty Smith',
    favorite: false,
    image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  ),
  CharacterCardPresentationModel(
    id: 5,
    name: 'Morty Smith',
    favorite: false,
    image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
    status: 'Alive',
    species: 'Human',
    location: 'Earth (C-137)',
  ),
];