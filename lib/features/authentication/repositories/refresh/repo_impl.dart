// // ignore_for_file: invalid_return_type_for_catch_error

// import 'package:get/get.dart';
// import 'package:networks_app/features/authentication/models/refresh_model.dart';
// import 'package:networks_app/features/authentication/repositories/refresh/repo.dart';
// import 'package:networks_app/utils/constants/api_constants.dart';
// import 'package:networks_app/utils/api/dio_helper.dart';
// import 'package:networks_app/utils/logging/logger.dart';
// import 'package:networks_app/utils/storage/cache_helper.dart';

// class RefreshRepositoryImpl implements RefreshRepository{
//   static RefreshRepositoryImpl get instance => Get.find();

//   String? token = TCacheHelper.getData(key: "token");

//   @override
//   Future<RefreshModel> refresh() async{
//     final dioHelper = TDioHelper();
//     return await dioHelper.post(TApiConstants.refresh, {}, token: token)
//         .then((response) => RefreshModel.fromJson(response))
//         .catchError((error) => TLoggerHelper.error(error.toString()));
//   }
// }