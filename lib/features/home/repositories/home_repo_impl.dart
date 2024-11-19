// ignore_for_file: invalid_return_type_for_catch_error
import 'package:get/get.dart';
import 'package:networks_app/features/home/models/create_group.dart';
import 'package:networks_app/features/home/models/groups_model.dart';
import 'package:networks_app/features/home/repositories/home_repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class HomeRepositoryImpl implements HomeRepository {
  static HomeRepositoryImpl get instance => Get.find();
  @override
  Future<GroupsModel> getGroups() async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .get(TApiConstants.getGroups, token: TCacheHelper.getData(key: "token"))
        .then((response) => GroupsModel.fromJson(response))
        .catchError((error) => TLoggerHelper.error(error.toString()));
  }

  @override
  Future<CreateGroup> createGroup({required String groupName}) async {
    final dioHelper = TDioHelper();
    return await dioHelper
        .post(
            TApiConstants.createGroup,
            token: TCacheHelper.getData(key: "token"),
            {"name": groupName})
        .then((response) => CreateGroup.fromJson(response))
        .catchError((error) => TLoggerHelper.error(error.toString()));
  }
}
