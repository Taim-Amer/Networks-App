import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/alerts/snackbar.dart';
import 'package:networks_app/features/groups/models/group_model.dart';
import 'package:networks_app/features/groups/models/users_in_group_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';
import 'package:networks_app/features/groups/repositories/group_repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/logging/logger.dart';

class GroupController extends GetxController {
  static GroupController get instance => Get.find();

  var isOwner = false.obs;
  var groupId = 0.obs;

  var getUsersOutGroupState = RequestState.begin.obs;
  var getUsersInGroupState = RequestState.begin.obs;
  var createInvitationState = RequestState.begin.obs;
  var getGroupsApiStatus = RequestState.begin.obs;
  var createGroupsApiStatus = RequestState.begin.obs;

  final groupNameController = TextEditingController();

  final GroupRepoImpl groupRepositoryImpl = GroupRepoImpl.instance;

  final Rx<UsersOutGroupModel> usersOutGroupModel = UsersOutGroupModel().obs;
  final Rx<UsersInGroupModel> usersInGroupModel = UsersInGroupModel().obs;
  final Rx<GroupModel> groupModel = GroupModel().obs;

  void updateGetUserOutGroupStatus(RequestState value) {
    getUsersOutGroupState.value = value;
  }

  void updateGetUserInGroupStatus(RequestState value) {
    getUsersInGroupState.value = value;
  }

  void updateGetGroupsStatus(RequestState value) {
    getGroupsApiStatus.value = value;
  }

  void updateCreateGroupsStatus(RequestState value) {
    createGroupsApiStatus.value = value;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   print("-----------------------");
  //   getGroups();
  //   isOwner.value = Get.parameters['IsOwner'] == "true";
  //   groupId.value = int.parse(Get.parameters['groupID'] ?? '0');
  //   if (isOwner.value) {
  //     getUsersOutGroup();
  //   }
  // }

  bool isUserOwner(int groupId) {
    final groups = groupModel.value.response;
    if (groups == null || groups.isEmpty) {
      return false;
    }
    return groups.any((group) => group.id == groupId && (group.isOwner ?? false));
  }

  Future<void> createInvitation({required int userID, required int groupID}) async {
    createInvitationState.value = RequestState.loading;
    try {
      final response = await groupRepositoryImpl.groupInvitation(groupID: groupID, userID: userID);
      if (response.status == true) {
        createInvitationState.value = RequestState.success;
        showSnackBar(response.message ?? '', AlertState.success);
      } else {
        createInvitationState.value = RequestState.error;
      }
    } catch (error) {
      createInvitationState.value = RequestState.error;
      showSnackBar('There is previous invitation for this user to this group.', AlertState.warning);
      TLoggerHelper.info(error.toString());
    }
  }

  Future<void> getUsersOutGroup({required int groupID}) async {
    updateGetUserOutGroupStatus(RequestState.loading);
    try {
      UsersOutGroupModel fetchedUsers = await groupRepositoryImpl.getUsersOutGroup(groupID: groupID.toString());
      if (fetchedUsers.status == true) {
        usersOutGroupModel.value = fetchedUsers;
        updateGetUserOutGroupStatus(RequestState.success);
      } else {
        updateGetUserOutGroupStatus(RequestState.error);
      }
    } catch (error) {
      updateGetUserOutGroupStatus(RequestState.error);
    }
  }

  Future<void> getUsersInGroup({required int groupID}) async {
    updateGetUserInGroupStatus(RequestState.loading);
    try {
      final response = await groupRepositoryImpl.getUsersInGroup(groupID: groupID);
      if (response.status == true) {
        usersInGroupModel.value = response;
        updateGetUserInGroupStatus(RequestState.success);
      } else {
        updateGetUserInGroupStatus(RequestState.error);
      }
    } catch (error) {
      TLoggerHelper.warning(error.toString());
      updateGetUserInGroupStatus(RequestState.error);
    }
  }

  Future<void> getGroups() async{
    updateGetGroupsStatus(RequestState.loading);
    try{
      final response = groupModel.value = await GroupRepoImpl.instance.getGroups();
      if(response.status == true){
        isOwner.value = response.response!.any((group) => group.isOwner == true);
        if(response.response!.isEmpty){
          updateGetGroupsStatus(RequestState.noData);
        } else{
          updateGetGroupsStatus(RequestState.success);
        }
      }
    } catch(error){
      updateGetGroupsStatus(RequestState.error);
    }
  }

  Future<void> createGroup() async{
    updateCreateGroupsStatus(RequestState.loading);
    try{
      final response = await GroupRepoImpl.instance.createGroup(name: groupNameController.text);
      if(response.status == true){
        updateCreateGroupsStatus(RequestState.success);
        Get.back();
        await getGroups();
        showSnackBar(response.response ?? "", AlertState.success);
      } else{
        updateCreateGroupsStatus(RequestState.error);
      }
    } catch(error){
      updateCreateGroupsStatus(RequestState.error);
      TLoggerHelper.error(error.toString());
    }
  }
}
