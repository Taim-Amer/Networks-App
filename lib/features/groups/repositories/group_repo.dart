import 'package:networks_app/features/groups/models/create_group_model.dart';
import 'package:networks_app/features/groups/models/get_group_invitation_model.dart';
import 'package:networks_app/features/groups/models/group_invitation_model.dart';
import 'package:networks_app/features/groups/models/group_model.dart';
import 'package:networks_app/features/groups/models/invitation_response_model.dart';
import 'package:networks_app/features/groups/models/users_in_group_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';

abstract class GroupRepo {
  Future<UsersOutGroupModel> getUsersOutGroup({required String? groupID});
  Future<GroupInvitationResponse> groupInvitation({required int groupID , required int userID});
  Future<GroupModel> getGroups();
  Future<CreateGroupModel> createGroup({required String name});
  Future<UsersInGroupModel> getUsersInGroup({required int groupID});

  Future<GetGroupInvitationModel> getGroupInvitation();
  Future<InvitationResponseModel> invitationResponse({required int groupID, required int response});
}
