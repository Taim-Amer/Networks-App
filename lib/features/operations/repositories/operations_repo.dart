import 'package:networks_app/features/operations/models/file_operations_model.dart';
import 'package:networks_app/features/operations/models/user_operations_model.dart';

abstract class OperationsRepo{
  Future<FileOperationsModel> getFileOperations({required int fileID});
  Future<UserOperationsModel> getUserOperations({required int userID, required groupID});
  Future<void> exportUserOperations({required int userID, required int groupID, required String exportType});
  Future<void> exportFileOperations({required int fileID, required String exportType});
}