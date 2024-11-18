import 'package:get/get.dart';
import 'package:networks_app/features/groups/models/file_model.dart';
import 'package:networks_app/features/groups/repositories/files/repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';

class FilesController extends GetxController{
  static FilesController get instance => Get.find();

  final fileModel = FileModel().obs;

  var getFileApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    getFileApiStatus.value = value;
  }

  Future<void> getFiles({required int groupId}) async{
    updateStatus(value: RequestState.loading);
    try {
      fileModel.value = await FilesRepositoryImpl.instance.getFiles(groupId: groupId);
      updateStatus(value: RequestState.success);
    } catch(error){
      updateStatus(value: RequestState.error);
    }
  }
}