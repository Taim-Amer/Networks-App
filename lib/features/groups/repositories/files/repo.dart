import 'package:networks_app/features/groups/models/file_model.dart';

abstract class FilesRepository{
    Future<FileModel> getFiles({required int groupId});
}