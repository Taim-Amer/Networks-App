import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/groups/models/group_inviation_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';
import 'package:networks_app/features/groups/repositories/group_repo_impl.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';

class GroupController extends GetxController {
  static GroupController get instance => Get.find();

  var isOwner = false.obs;
  var groupId = 0.obs;

  var getUsersOutGroupState = RequestState.begin.obs;
  var createInviationState = RequestState.begin.obs;

  final GroupRepoImpl groupRepositoryImpl = GroupRepoImpl.instance;

  void updateStatus(RequestState value) {
    getUsersOutGroupState.value = value;
  }

  final Rx<UsersOutGroupModel> usersOutGroupModel = UsersOutGroupModel().obs;

  @override
  void onInit() {
    super.onInit();
    isOwner.value = Get.parameters['IsOwner'] == "true";
    groupId.value = int.parse(Get.parameters['groupID'] ?? '0');
    if (isOwner.value) {
      getUsersOutGroup();
    }
  }

  Future<void> createInviation({String? userID}) async {
    createInviationState.value = RequestState.loading;
    try {
      GroupInvitationResponse response = await groupRepositoryImpl
          .groupInviation(groupID: groupId.value.toString(), userID: userID);
      if (response.status == true &&
          response.message == "The invitation has send successfully.") {
        createInviationState.value = RequestState.success;
        Get.snackbar("Success", "The invitation has send successfully.",
            backgroundColor: TColors.secondary, colorText: Colors.white);
      } else {
        createInviationState.value = RequestState.error;
      }
    } catch (error) {
      createInviationState.value = RequestState.error;
      // ignore: avoid_print
      print("Error fetching groups: $error");
    }
  }

  Future<void> getUsersOutGroup() async {
    updateStatus(RequestState.loading);
    try {
      UsersOutGroupModel fetchedUsers = await groupRepositoryImpl
          .getUsersOutGroup(groupID: groupId.value.toString());
      if (fetchedUsers.status == true) {
        usersOutGroupModel.value = fetchedUsers;
        updateStatus(RequestState.success);
      } else {
        updateStatus(RequestState.error);
      }
    } catch (error) {
      updateStatus(RequestState.error);
      // ignore: avoid_print
      print("Error fetching groups: $error");
    }
  }
}
