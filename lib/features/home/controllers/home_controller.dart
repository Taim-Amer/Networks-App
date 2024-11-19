import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/home/models/create_group.dart';
import 'package:networks_app/features/home/models/groups_model.dart';
import 'package:networks_app/features/home/repositories/home_repo_impl.dart';
import 'package:networks_app/features/home/screens/widgets/create_group_view.dart';
import 'package:networks_app/features/home/screens/widgets/groups_list_view.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/helpers/helper_functions.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  final HomeRepositoryImpl homeRepositoryImpl = HomeRepositoryImpl.instance;

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController createGroupController = TextEditingController();

  final Rx<GroupsModel> groupsModel = GroupsModel().obs;

  var getGroupsApiStatus = RequestState.begin.obs;
  var getCreateGroupApiStatis = RequestState.begin.obs;

  RxInt selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  static List<Widget> widgetOptions = [
    const GroupsListView(),
    const CreateGroupView(),
  ];

  @override
  void onInit() {
    super.onInit();
    getGroups(); 
  }

  Future<void> getGroups() async {
    updateStatus(RequestState.loading);
    try {
      GroupsModel fetchedGroups = await homeRepositoryImpl.getGroups();
      if (fetchedGroups.status == true) {
        groupsModel.value = fetchedGroups;
        updateStatus(RequestState.success);
      } else {
        updateStatus(RequestState.error);
      }
    } catch (error) {
      updateStatus(RequestState.error);
      // ignore: avoid_print
      print("Error fetching groups: $error");
    }
  }

  Future<void> createGroup() async {
    getCreateGroupApiStatis.value = RequestState.loading;
    try {
      CreateGroup createGroup = await homeRepositoryImpl.createGroup(
          groupName: createGroupController.text);
      if (createGroup.status == true &&
          createGroup.response == "Group created successfully.") {
        THelperFunctions.showSnackBar(createGroup.response!);
        getCreateGroupApiStatis.value = RequestState.success;
        createGroupController.clear();
        getGroups();
      } else {
        getCreateGroupApiStatis.value = RequestState.error;
      }
    } catch (error) {
      getCreateGroupApiStatis.value = RequestState.error;
    }
  }

  void updateStatus(RequestState value) {
    getGroupsApiStatus.value = value;
  }

  void updateCreateGroupStatus(RequestState value) {
    getCreateGroupApiStatis.value = value;
  }
}
