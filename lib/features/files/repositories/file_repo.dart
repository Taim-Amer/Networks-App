import 'package:networks_app/features/groups/models/file_model.dart';

abstract class FileRepo{
  Future<FileModel> getFiles();
}