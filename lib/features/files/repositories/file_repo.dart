import 'dart:io';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/models/check_in_file_model.dart';
import 'package:networks_app/features/files/models/edit_file_model.dart';
import 'package:networks_app/features/files/models/file_model.dart';
import 'package:networks_app/features/operations/models/file_operations_model.dart';
import 'package:networks_app/features/files/models/file_request_model.dart';
import 'package:networks_app/features/files/models/file_versions_model.dart';
import 'package:networks_app/features/files/models/get_file_requests_model.dart';

abstract class FileRepo{
  Future<FileModel> getFiles({required int groupID});
  Future<AddFileModel> addFile(File file, int groupID, int isFree, int userID);
  // Future<DeleteFileModel> deleteFile(int fileID);
  Future<void> downloadFile({required int fileID});
  Future<CheckInFileModel> checkInFile(List<int> fileIDs);
  Future<EditFileModel> editFile(String fileName, String filePath, int groupID);

  Future<FileVersionsModel> getFileVersions({required int fileID});
  Future<void> downloadVersion({required int fileID, required int versionNumber});
  Future<GetFileRequestsModel> getFileRequests({required int groupID});
  Future<FileRequestModel> fileResponse({required int id, required int response});
}