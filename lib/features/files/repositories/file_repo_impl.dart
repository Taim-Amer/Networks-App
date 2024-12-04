import 'dart:io';
import 'package:get/get.dart';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/models/check_in_file_model.dart';
import 'package:networks_app/features/files/models/delete_file_model.dart';
import 'package:networks_app/features/files/models/edit_file_model.dart';
import 'package:networks_app/features/files/repositories/file_repo.dart';
import 'package:networks_app/features/files/models/file_model.dart';
import 'package:networks_app/utils/api/dio_helper.dart';
import 'package:networks_app/utils/api/multimedia_helper.dart';
import 'package:networks_app/utils/constants/api_constants.dart';
import 'package:networks_app/utils/logging/logger.dart';
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

  @override
  Future<AddFileModel> addFile(String fileName, String filePath, int isFree, int userID) async {
    try {
      List<int> fileBytes = await File(filePath).readAsBytes();
      final multiMediaHelper = TMultiMediaHelper();
      return await multiMediaHelper.uploadFile(
        token: token,
        data: {
          'group_id': TCacheHelper.getData(key: 'group_id'),
          'isFree': isFree,
          'user_id': userID,
        },
        fileBytes: fileBytes,
        fileName: fileName,
        endPoint: TApiConstants.addFiles,
      ).then((response) => AddFileModel.fromJson(response));
    } catch (error) {
      TLoggerHelper.error("Error uploading file: $error");
      rethrow;
    }
  }

  @override
  Future<CheckInFileModel> checkInFile(List<int> fileIDs) {
    // TODO: implement checkInFile
    throw UnimplementedError();
  }

  @override
  Future<DeleteFileModel> deleteFile(int fileID) async{
    final dioHelper = TDioHelper();
    return await dioHelper.delete(TApiConstants.deleteFiles, token: token)
  }

  @override
  Future<void> downloadFile(int fileID) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

  @override
  Future<EditFileModel> editFile(String fileName, String filePath, int groupID) {
    // TODO: implement editFile
    throw UnimplementedError();
  }
}