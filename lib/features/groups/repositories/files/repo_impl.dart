// ignore_for_file: invalid_return_type_for_catch_error

import 'package:get/get.dart';
import 'package:networks_app/features/groups/models/file_model.dart';
import 'package:networks_app/features/groups/repositories/files/repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class FilesRepositoryImpl implements FilesRepository{
  static FilesRepositoryImpl get instance => Get.find();

  String? token = TCacheHelper.getData(key: "token");

  @override
  Future<FileModel> getFiles({required int groupId}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getFiles, token: token, queryParameters: {'group_id' : groupId})
        .then((response) => FileModel.fromJson(response))
        .catchError((error) => TLoggerHelper.info(error.toString()));
  }
}