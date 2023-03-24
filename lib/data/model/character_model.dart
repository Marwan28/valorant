import 'package:valorant/data/model/ability_model.dart';
import 'package:valorant/data/model/role_model.dart';
import 'package:valorant/data/model/voice_line.dart';

class Character {
  String description;
  String displayName;
  String displayIcon;
  String fullPortrait;
  List<Ability> abilities;
  VoiceLine voiceLine;
  Role role;

  Character({
    required this.description,
    required this.displayName,
    required this.displayIcon,
    required this.fullPortrait,
    required this.abilities,
    required this.voiceLine,
    required this.role,
  });
}
