part of 'character_cubit.dart';

@immutable
abstract class CharacterState {}

class CharacterInitial extends CharacterState {}


class CharacterLoadingState extends CharacterState{}


class CharacterLoadedState extends CharacterState{
  List<Character> characterList;

  CharacterLoadedState({required this.characterList});


  @override
  bool operator == (Object other){
    if(identical(this,other)){
      return true;
    }
    return other is CharacterLoadedState && other.characterList == characterList;
  }

  @override
  int get hashCode => characterList.hashCode;


}

class CharacterErrorState extends CharacterState{
  String message;

  CharacterErrorState({required this.message});



  @override
  bool operator == (Object other){
    if(identical(this,other)){
      return true;
    }
    return other is CharacterErrorState && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;


}
