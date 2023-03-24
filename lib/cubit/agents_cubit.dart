import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'agents_state.dart';

class AgentsCubit extends Cubit<AgentsState> {
  AgentsCubit() : super(AgentsInitial());
}
