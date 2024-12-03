import 'package:get/get.dart';
import 'package:networks_app/features/files/repositories/file_repo.dart';
import 'package:networks_app/features/groups/models/file_model.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class FileRepoImpl extends FileRepo{
  static FileRepoImpl get instance => Get.find();

  final token = TCacheHelper.getData(key: 'token');

  @override
  Future<FileModel> getFiles() async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(TApiConstants.getFiles, token: token)
        .then((response) => FileModel.fromJson(response));
  }
}