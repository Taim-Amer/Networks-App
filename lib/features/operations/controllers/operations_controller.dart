import 'package:get/get.dart';
import 'package:networks_app/common/widgets/alerts/snackbar.dart';
import 'package:networks_app/features/operations/models/file_operations_model.dart';
import 'package:networks_app/features/operations/models/user_operations_model.dart';
import 'package:networks_app/features/operations/repositories/operations_repo_impl.dart';
import 'package:networks_app/localization/keys.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class OperationsController extends GetxController{
  static OperationsController get instance => Get.find();

  final Rx<FileOperationsModel> fileOperationsModel = FileOperationsModel().obs;
  final Rx<UserOperationsModel> userOperationsModel = UserOperationsModel().obs;

  Future<bool> getFileOperations({required fileID}) async{
    try{
      final response = await OperationsRepoImpl.instance.getFileOperations(fileID: fileID);
      if(response.status == true){
        fileOperationsModel.value = response;
        return true;
      } else{
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
        return false;
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      return false;
    }
  }

  Future<bool> getUserOperations({required int userID}) async{
    try{
      final response = await OperationsRepoImpl.instance.getUserOperations(groupID: TCacheHelper.getData(key: 'group_id'), userID: userID);
      if(response.status == true){
        userOperationsModel.value = response;
        return true;
      } else{
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
        return false;
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      return false;
    }
  }

  Future<void> exportUserOperations({required int userID}) async{
    try{
      await OperationsRepoImpl.instance.exportUserOperations(groupID: TCacheHelper.getData(key: 'group_id'), userID: userID, exportType: 'pdf');
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> exportFileOperations({required int fileID}) async{
    try{
      await OperationsRepoImpl.instance.exportFileOperations(fileID: fileID, exportType: 'pdf');
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }
}
