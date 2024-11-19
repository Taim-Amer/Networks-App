import 'package:networks_app/features/home/models/create_group.dart';
import 'package:networks_app/features/home/models/groups_model.dart';

abstract class HomeRepository {
  Future<GroupsModel> getGroups();
  Future<CreateGroup> createGroup({required String groupName});
}
