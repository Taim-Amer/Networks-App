import 'dart:io';
import 'package:get/get.dart';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/models/check_in_file_model.dart';
import 'package:networks_app/features/files/models/edit_file_model.dart';
import 'package:networks_app/features/files/models/file_request_model.dart';
import 'package:networks_app/features/files/models/file_versions_model.dart';
import 'package:networks_app/features/files/models/get_file_requests_model.dart';
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
  Future<FileModel> getFiles({required int groupID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.getFiles,
      token: token,
      queryParameters: {"group_id" : groupID}
    ).then((response) => FileModel.fromJson(response));
  }

  @override
  Future<AddFileModel> addFile(File file, int groupID, int isFree, int userID) async {
    try {
      String token = TCacheHelper.getData(key: 'token');
      String fileName = file.uri.pathSegments.last;

      List<int> fileBytes = await file.readAsBytes();

      Map<String, dynamic> data = {
        "isFree": isFree,
        "user_id": userID,
        "group_id": groupID,
      };

      Map<String, dynamic> response = await TMultiMediaHelper().uploadFile(
        data: data,
        fileBytes: fileBytes,
        fileName: fileName,
        endPoint: TApiConstants.addFiles,
        token: token,
      );

      return AddFileModel.fromJson(response);
    } catch (e) {
      // TLoggerHelper.error("Error in addFile: $e");
      rethrow;
    }
  }

  @override
  Future<CheckInFileModel> checkInFile(List<int> fileIDs) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
        TApiConstants.checkInFiles,
        token: token,
        data: {"ids" : fileIDs}
    ).then((response) => CheckInFileModel.fromJson(response));
  }

  @override
  Future<void> downloadFile({required int fileID}) async{
    final dioHelper = TDioHelper();
    try {
      await dioHelper.download(
        endPoint: TApiConstants.downloadFiles,
        fileName: 'downloaded_file_$fileID',
        savePath: 'C:\\Users\\taim\\StudioProjects\\networks_app\\lib\\utils\\downloaded',
        data: {
          "file_id" : fileID
        }
      );
    } catch (e) {
      TLoggerHelper.error("Error downloading file: $e");
      rethrow;
    }
  }

  @override
  Future<EditFileModel> editFile(String fileName, String filePath, int groupID) {
    // TODO: implement editFile
    throw UnimplementedError();
  }

  @override
  Future<void> downloadVersion({required int fileID, required int versionNumber}) {
    // TODO: implement downloadVersion
    throw UnimplementedError();
  }

  @override
  Future<FileRequestModel> fileResponse({required int id, required int response}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.post(
      TApiConstants.fileResponse,
      data: {
        "add_file_request_id" : id,
        "response" : response,
      },
      token: token,
    ).then((response) => FileRequestModel.fromJson(response));
  }

  @override
  Future<GetFileRequestsModel> getFileRequests({required int groupID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.getFileRequest,
      queryParameters: {"group_id" : groupID},
      token: token,
    ).then((response) => GetFileRequestsModel.fromJson(response));
  }

  @override
  Future<FileVersionsModel> getFileVersions({required int fileID}) async{
    final dioHelper = TDioHelper();
    return await dioHelper.get(
      TApiConstants.getFileVersions,
      queryParameters: {"file_id" : fileID},
      token: token,
    ).then((response) => FileVersionsModel.fromJson(response));
  }
}