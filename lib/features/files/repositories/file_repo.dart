import 'dart:io';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/models/check_in_file_model.dart';
import 'package:networks_app/features/files/models/edit_file_model.dart';
import 'package:networks_app/features/files/models/file_model.dart';

abstract class FileRepo{
  Future<FileModel> getFiles({required int groupID});
  Future<AddFileModel> addFile(File file, int groupID, int isFree, int userID);
  // Future<DeleteFileModel> deleteFile(int fileID);
  Future<void> downloadFile({required int fileID});
  Future<CheckInFileModel> checkInFile(List<int> fileIDs);
  Future<EditFileModel> editFile(String fileName, String filePath, int groupID);
}