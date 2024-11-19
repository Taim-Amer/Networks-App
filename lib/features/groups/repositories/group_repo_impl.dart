// ignore_for_file: invalid_return_type_for_catch_error

import 'package:get/get.dart';
import 'package:networks_app/features/groups/models/group_inviation_model.dart';
import 'package:networks_app/features/groups/models/users_out_group_model.dart';
import 'package:networks_app/features/groups/repositories/group_repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class GroupRepoImpl implements GroupRepo {
  static GroupRepoImpl get instance => Get.find();
  @override
  Future<UsersOutGroupModel> getUsersOutGroup(
      {required String? groupID}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .get(TApiConstants.usersOutGroup,
            token: TCacheHelper.getData(key: "token"),
            queryParameters: {"group_id": groupID})
        .then((response) => UsersOutGroupModel.fromJson(response))
        .catchError((error) => TLoggerHelper.error(error.toString()));
  }

  @override
  Future<GroupInvitationResponse> groupInviation(
      {required String? groupID, required String? userID}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .post(
            TApiConstants.groupInviation,
            token: TCacheHelper.getData(key: "token"),
            {"group_id": groupID, "user_id": userID})
        .then((response) => GroupInvitationResponse.fromJson(response))
        .catchError((error) => TLoggerHelper.error(error.toString()));
  }
}
