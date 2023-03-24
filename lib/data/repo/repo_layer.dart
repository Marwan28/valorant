import 'package:valorant/data/web_service/web-service.dart';

class RepoLayer{
  final WebService apiProvider;
  RepoLayer({required this.apiProvider});
  Future<dynamic> getAllAgentData()async{
    return apiProvider.getAllAgentData();
  }
}