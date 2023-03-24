import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/view/widgets/agents_list.dart';
import 'package:valorant/cubit/character_cubit.dart';
import 'package:valorant/data/model/character_model.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({Key? key}) : super(key: key);

  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  List<Character> characters = [];

  @override
  Widget build(BuildContext context) {
    return AgentsList(data: characters, count: 2);
  }

  @override
  void initState() {
    // context.read<CharactersCubit>().getCharacters();
    final cubitData = BlocProvider.of<CharacterCubit>(context);
    if (cubitData.state is CharacterLoadedState) {
      characters = (cubitData.state as CharacterLoadedState).characterList;
      // print(characters);
    }
    super.initState();
  }
}