import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valorant/data/model/ability_model.dart';
import 'package:valorant/data/model/character_model.dart';
import 'package:valorant/data/model/role_model.dart';
import 'package:valorant/data/model/voice_line.dart';
import 'package:valorant/data/repo/repo_layer.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit({required this.repoLayer}) : super(CharacterInitial());
  final RepoLayer repoLayer;

  Future<void> getCharacter()async{
    try{
      emit(CharacterLoadingState());
      final listOfCharacterModel = await requestCharacter();
      emit(CharacterLoadedState(characterList: listOfCharacterModel));
    }catch (e){
      emit(CharacterErrorState(message: e.toString()));
    }
  }

  Future<List<Character>> requestCharacter() async {
    try {
      final response = await repoLayer.getAllAgentData();
      if (response == null) {
        return [];
      }

      final responseDecoded = json.decode(response.body);
      final data = responseDecoded['data'] as List<dynamic>;

      final list = data
          .map((dynamic e) {
            final role = e['role'] ?? {};
            final roleInfo = Role(
                uuid: role['uuid'] ?? '',
                displayIcon: role['displayIcon'] ?? '',
                description: role['description'] ?? '',
                displayName: role['displayName'] ?? '');

            final ability = e['abilities'] as List<dynamic>;
            final abilityInfo = ability.map((a) {
              return Ability(
                slot: a['slot'] ?? '',
                displayIcon: a['displayIcon'] ?? '',
                description: a['description'] ?? '',
                displayName: a['displayName'] ?? '',
              );
            }).toList();
            abilityInfo
                .retainWhere((element) => element.displayIcon.isNotEmpty);

            final voiceLine = e['voiceLine'] ?? {};
            final voiceMediaList = voiceLine['mediaList'] as List;
            final voiceMedia = VoiceLine(voiceLine: voiceMediaList[0]['wave']);

            return Character(
              description: e['description'] ?? '',
              displayName: e['displayName'] ?? '',
              displayIcon: e['displayIcon'] ?? '',
              fullPortrait: e['fullPortrait'] ?? '',
              abilities: abilityInfo,
              voiceLine: voiceMedia,
              role: roleInfo,
            );
          })
          .toSet()
          .toList();
      list.retainWhere((element) => element.fullPortrait.isNotEmpty);
      return list;
    } catch (e) {
      e.toString();
      throw Exception(e);
    }
  }
}
