import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:networks_app/features/home/controllers/home_controller.dart';
import 'package:networks_app/utils/constants/colors.dart';
import 'package:networks_app/utils/constants/enums.dart';
import 'package:networks_app/utils/router/app_router.dart';

class GroupsListView extends StatelessWidget {
  const GroupsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController.instance;
    return Scaffold(
        body: Obx(
      () => homeController.getGroupsApiStatus.value == RequestState.loading
          ? const Center(
              child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: TColors.primary,
                ),
              ),
            )
          : homeController.getGroupsApiStatus.value == RequestState.loading
              ? const Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: Text("Some thing went wrong",
                        style: TextStyle(
                          color: TColors.error,
                        )),
                  ),
                )
              : ListView.builder(
                  itemCount: homeController.groupsModel.value.response!.length,
                  itemBuilder: (context, index) {
                    final group =
                        homeController.groupsModel.value.response![index];
                    return InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.group, parameters: {
                          "IsOwner": group.isOwner==true?"true":"false",
                          "groupID": "${group.id}"
                        });
                      },
                      child: Card(
                        child: ListTile(
                          title: Text(group.name ?? "No name"),
                          subtitle: Text(
                              '${group.user?.name ?? "Unknown"} (${group.user?.email ?? "No email"})'),
                        ),
                      ),
                    );
                  },
                ),
    ));
  }
}
