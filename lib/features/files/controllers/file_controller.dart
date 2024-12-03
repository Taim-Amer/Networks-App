import 'package:get/get.dart';
import 'package:networks_app/features/files/repositories/file_repo_impl.dart';
import 'package:networks_app/features/groups/models/file_model.dart';
import 'package:networks_app/utils/constants/enums.dart';

class FileController extends GetxController{
  static FileController get instance => Get.find();

  var getFilesApiStatus = RequestState.begin.obs;

  final Rx<FileModel> fileModel = FileModel().obs;

  void updateGetFilesStatus(RequestState value) {
    getFilesApiStatus.value = value;
  }

  Future<void> getFiles() async{
    updateGetFilesStatus(RequestState.loading);
    fileModel.value = await FileRepoImpl.instance.getFiles();
    if(fileModel.value.status == true){
      updateGetFilesStatus(RequestState.success);
    } else{
      updateGetFilesStatus(RequestState.error);
    }
  }
}