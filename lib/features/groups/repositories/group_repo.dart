import 'package:networks_app/features/groups/models/group_inviation_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';

abstract class GroupRepo {
  Future<UsersOutGroupModel> getUsersOutGroup({required String? groupID});
  Future<GroupInvitationResponse> groupInviation({required String? groupID , required String? userID});
}
