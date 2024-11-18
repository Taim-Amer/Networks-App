import 'package:get/get.dart';
import 'package:networks_app/features/authentication/models/refresh_model.dart';
import 'package:networks_app/features/authentication/repositories/refresh/repo_impl.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';
import 'package:networks_app/utils/storage/cache_helper.dart';

class RefreshController extends GetxController{
  static RefreshController get instance => Get.find();

  final refreshModel = RefreshModel().obs;

  var refreshApiStatus = RequestState.begin.obs;

  void updateStatus({required RequestState value}) {
    refreshApiStatus.value = value;
  }

  @override
  Future<void> refresh() async{
    updateStatus(value: RequestState.loading);
    try{
      refreshModel.value = await RefreshRepositoryImpl.instance.refresh();
      if(refreshModel.value.status == true){
        updateStatus(value: RequestState.success);
        TCacheHelper.saveData(key: "token", value: refreshModel.value.accessToken);
      }
    } catch(error){
      updateStatus(value: RequestState.error);
      THelperFunctions.showSnackBar(error.toString());
    }
  }
}