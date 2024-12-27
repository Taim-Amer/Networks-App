import 'package:get/get.dart';
import 'package:networks_app/features/operations/models/file_operations_model.dart';
import 'package:networks_app/features/operations/models/user_operations_model.dart';
import 'package:networks_app/features/operations/repositories/operations_repo.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class OperationsRepoImpl implements OperationsRepo{
  static OperationsRepoImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: 'token');

  @override
  Future<FileOperationsModel> getFileOperations({required int fileID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.fileOperations,
      queryParameters: {"file_id" : fileID},
      token: token,
    ).then((response) => FileOperationsModel.fromJson(response));
  }

  @override
  Future<UserOperationsModel> getUserOperations({required int userID, required groupID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.userOperations,
      queryParameters: {"group_id" : groupID, 'user_id' : userID},
      token: token,
    ).then((response) => UserOperationsModel.fromJson(response));
  }
}