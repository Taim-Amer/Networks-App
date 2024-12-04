import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/groups/models/file_model.dart';

abstract class FileRepo{
  Future<FileModel> getFiles();
  Future<AddFileModel> addFile(String fileName, String filePath, int isFree, int userID);
}