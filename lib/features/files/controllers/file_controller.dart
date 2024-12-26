import 'dart:io';
import 'package:get/get.dart';
import 'package:networks_app/common/widgets/alerts/snackbar.dart';
import 'package:networks_app/features/files/models/add_file_model.dart';
import 'package:networks_app/features/files/models/check_in_file_model.dart';
import 'package:networks_app/features/files/models/file_request_model.dart';
import 'package:networks_app/features/files/models/file_versions_model.dart';
import 'package:networks_app/features/files/models/get_file_requests_model.dart';
import 'package:networks_app/features/files/repositories/file_repo_impl.dart';
import 'package:networks_app/features/files/models/file_model.dart';
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
  final Rx<CheckInFileModel> checkInModel = CheckInFileModel().obs;
  final Rx<FileVersionsModel> fileVersionsModel = FileVersionsModel().obs;
  final Rx<GetFileRequestsModel> getFileRequestsModel = GetFileRequestsModel().obs;
  final Rx<FileRequestModel> fileRequestModel = FileRequestModel().obs;

  void updateGetFilesStatus(RequestState value) {
    getFilesApiStatus.value = value;
  }

  void updateAddFilesStatus(RequestState value) {
    addFileApiStatus.value = value;
  }

  Future<void> getFiles({required groupID}) async{
    updateGetFilesStatus(RequestState.loading);
    fileModel.value = await FileRepoImpl.instance.getFiles(groupID: groupID);
    if(fileModel.value.status == true){
      if(fileModel.value.response!.isEmpty){
        updateGetFilesStatus(RequestState.noData);
      }
      updateGetFilesStatus(RequestState.success);
    } else{
      updateGetFilesStatus(RequestState.error);
    }
  }

  Future<void> addFile(int? userID, {required int isFree}) async{
    updateAddFilesStatus(RequestState.loading);
    try{
      await TFileServices.pickFile();
      if (TFileServices.isFilePicked) {
        File file = File(TFileServices.path);
        final response = await FileRepoImpl.instance.addFile(
          file,
          TCacheHelper.getData(key: "group_id"),
          isFree,
          userID!,
        );
      if(addFileModel.value.status == true){
        updateAddFilesStatus(RequestState.success);
        showSnackBar(addFileModel.value.response!, AlertState.success);
      } else{
        updateAddFilesStatus(RequestState.error);
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      }
    }
    } catch(error){
      print(error.toString());
      print(error.toString());
      print(error.toString());
      print(error.toString());
      updateAddFilesStatus(RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> checkIn({required int fileID}) async{
    try{
      checkInModel.value = await FileRepoImpl.instance.checkInFile([fileID]);
      if(checkInModel.value.status == true){
        showSnackBar(checkInModel.value.response!, AlertState.success);
        getFiles(groupID: TCacheHelper.getData(key: "group_id"));
      } else{
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<void> downloadFile({required int fileID}) async {
    try {
      var fileData = await FileRepoImpl.instance.downloadFile(fileID: fileID);
      showSnackBar('File downloaded successfully!', AlertState.success);
    } catch (error) {
      showSnackBar('Error downloading file: $error', AlertState.error);
    }
  }

  Future<void> getFileVersion({required fileID}) async{
    try{
      final response = await FileRepoImpl.instance.getFileVersions(fileID: fileID);
      if(response.status == true){
        fileVersionsModel.value = response;
      } else{
        showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }

  Future<bool> getFileRequest() async{
    try{
      final response = await FileRepoImpl.instance.getFileRequests(groupID: TCacheHelper.getData(key: "group_id"));
      if(response.status == true){
        getFileRequestsModel.value = response;
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

  Future<void> fileResponse({required int fileID, required int ok}) async{
    try{
      final response = await FileRepoImpl.instance.fileResponse(id: fileID, response: ok);
      if(response.status == true){
        fileRequestModel.value = response;
        showSnackBar(response.response ?? "", AlertState.error);
      } else{
        showSnackBar(response.response ?? "", AlertState.error);
      }
    } catch(error){
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    }
  }
}