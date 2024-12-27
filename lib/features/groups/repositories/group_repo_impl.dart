import 'package:get/get.dart';
import 'package:networks_app/features/groups/models/create_group_model.dart';
import 'package:networks_app/features/groups/models/get_group_invitation_model.dart';
import 'package:networks_app/features/groups/models/group_invitation_model.dart';
import 'package:networks_app/features/groups/models/group_model.dart';
import 'package:networks_app/features/groups/models/invitation_response_model.dart';
import 'package:networks_app/features/groups/models/users_in_group_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';
import 'package:networks_app/features/groups/repositories/group_repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class GroupRepoImpl implements GroupRepo {
  static GroupRepoImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: "token");

  @override
  Future<UsersOutGroupModel> getUsersOutGroup({required String? groupID}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .get(TApiConstants.usersOutGroup,
            token: token,
            queryParameters: {"group_id": groupID})
        .then((response) => UsersOutGroupModel.fromJson(response));
  }

  @override
  Future<GroupInvitationResponse> groupInvitation({required int groupID, required int userID}) async {
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.groupInvitation,
      token: token,
      data: {"group_id": groupID, "user_id": userID}).then((response) => GroupInvitationResponse.fromJson(response));
  }

  @override
  Future<GroupModel> getGroups() async{
    final dioHelper = TDioHelper();
    return await dioHelper
        .get(TApiConstants.getGroups, token: TCacheHelper.getData(key: 'token'))
        .then((response) => GroupModel.fromJson(response));
  }

  @override
  Future<CreateGroupModel> createGroup({required String name}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.createGroup,
      token: token,
      data: {'name' : name}).then((response) => CreateGroupModel.fromJson(response));
  }

  @override
  Future<UsersInGroupModel> getUsersInGroup({required int groupID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.usersInGroup,
      token: token,
      queryParameters: {"group_id": groupID}).then((response) => UsersInGroupModel.fromJson(response));
  }

  @override
  Future<GetGroupInvitationModel> getGroupInvitation() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getGroupInvitations, token: token).then((response) => GetGroupInvitationModel.fromJson(response));
  }

  @override
  Future<InvitationResponseModel> invitationResponse({required int groupID, required int response}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
        TApiConstants.groupResponse,
        token: token,
        data: {
          'group_id' : groupID,
          'response' : response,
        }).then((response) => InvitationResponseModel.fromJson(response));
  }
}
