import 'package:get/get.dart';
import 'package:networks_app/common/widgets/alerts/snackbar.dart';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/repositories/file_repo_impl.dart';
import 'package:networks_app/features/groups/models/file_model.dart';
import 'package:networks_app/localization/keys.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/services/files.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class FileController extends GetxController{
  static FileController get instance => Get.find();

  var getFilesApiStatus = RequestState.begin.obs;
  var addFileApiStatus = RequestState.begin.obs;

  final Rx<FileModel> fileModel = FileModel().obs;
  final Rx<AddFileModel> addFileModel = AddFileModel().obs;

  // var name = TFileServices.fileName;
  // var path = TFileServices.path;

  void updateGetFilesStatus(RequestState value) {
    getFilesApiStatus.value = value;
  }

  void updateAddFilesStatus(RequestState value) {
    addFileApiStatus.value = value;
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

  Future<void> addFile(int? userID, {required int isFree}) async{
    updateAddFilesStatus(RequestState.loading);
    try{
      await TFileServices.pickFile();
      print(TFileServices.fileName);
      print(TFileServices.path);
      print(isFree);
      print(TCacheHelper.getData(key: 'group_id'));
      addFileModel.value = await FileRepoImpl.instance.addFile(TFileServices.fileName, TFileServices.path, isFree, userID ?? 0);

      if(addFileModel.value.status == true){
        updateAddFilesStatus(RequestState.success);
        showSnackBar(addFileModel.value.response!, AlertState.success);
      } else{
        updateAddFilesStatus(RequestState.error);
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      }
    } catch(error){
      updateAddFilesStatus(RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }
}